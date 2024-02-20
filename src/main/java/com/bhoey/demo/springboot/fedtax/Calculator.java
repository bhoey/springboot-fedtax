package com.bhoey.demo.springboot.fedtax;

import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import com.bhoey.demo.springboot.fedtax.models.TaxBracket;
import com.bhoey.demo.springboot.fedtax.repositories.TaxBracketRepository;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.List;

@Service
public class Calculator {

    private final TaxBracketRepository tbrepo;

    public Calculator(TaxBracketRepository tbrepo){
        this.tbrepo = tbrepo;
    }

    public CalculatorTotalResult determineTax(long income, FilingStatus filingStatus, int tax_year){
        CalculatorTotalResult result = new CalculatorTotalResult();

        result.setIncome(income);
        result.setFilingStatus(filingStatus);
        result.setTaxYear(tax_year);

        Sort tbsort = Sort.by("upperBound").ascending();
        List<TaxBracket> tbs = tbrepo.findByFilingStatus(filingStatus, tax_year, tbsort);

        BigDecimal taxOwed = new BigDecimal(0);

        TaxBracket topTaxBracket = null;
        long lastUpperBound = 0;
        for (TaxBracket tb: tbs){
            if (tb.getUpperBound() == null){
                // Spring's NULL sort handling is only a hint and is DB specific.
                // Instead of leaving a latent bug for the next poor soul lets
                // save the no-upper-bound entry as the top tax bracket and process
                // it after the others
                topTaxBracket = tb;
                continue;
            }

            CalculatorBracketResult taxAtBracket = getTaxAtBracket(income, lastUpperBound, tb);
            result.addBracketResult(taxAtBracket);
            taxOwed = taxOwed.add(taxAtBracket.getTaxOwed());

            lastUpperBound = tb.getUpperBound();
        }

        if (topTaxBracket != null){
            CalculatorBracketResult taxAtBracket = getTaxAtBracket(income, lastUpperBound, topTaxBracket);
            result.addBracketResult(taxAtBracket);
            taxOwed = taxOwed.add(taxAtBracket.getTaxOwed());
        }

        result.setTotalTax(taxOwed);
        result.setEffTaxRate(taxOwed.divide(BigDecimal.valueOf(income), MathContext.DECIMAL128));
        return result;
    }

    private CalculatorBracketResult getTaxAtBracket(long income, long lastUpperBound, TaxBracket bracket){

        long range_top = bracket.getUpperBound() == null
                ? income // Use income for top bracket
                : Math.min(income, bracket.getUpperBound());

        long incomeTaxableAtBracket = Math.max(range_top - lastUpperBound, 0);

        BigDecimal taxRate = bracket.getTaxRate();
        BigDecimal taxAtBracket = BigDecimal.valueOf(incomeTaxableAtBracket).multiply(taxRate);

        CalculatorBracketResult result = new CalculatorBracketResult();
        result.setBracket(bracket);
        result.setIncomeAffected(incomeTaxableAtBracket);
        result.setTaxOwed(taxAtBracket);

        return result;
    }
}
