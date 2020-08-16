package com.bhoey.demo.springboot.fedtax;

import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import lombok.Data;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
public class CalculatorTotalResult {
    private long income;
    private FilingStatus filingStatus;
    private int taxYear;
    private List<CalculatorBracketResult> bracketTaxes;
    private BigDecimal totalTax;
    private BigDecimal effTaxRate;

    public CalculatorTotalResult(){
        bracketTaxes = new ArrayList<>();
    }

    public void addBracketResult(CalculatorBracketResult bcr){
        bracketTaxes.add(bcr);
    }
}
