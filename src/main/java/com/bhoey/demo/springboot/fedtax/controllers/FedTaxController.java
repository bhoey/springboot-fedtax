package com.bhoey.demo.springboot.fedtax.controllers;

import com.bhoey.demo.springboot.fedtax.Calculator;
import com.bhoey.demo.springboot.fedtax.CalculatorTotalResult;
import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import com.bhoey.demo.springboot.fedtax.repositories.FilingStatusRepository;
import com.bhoey.demo.springboot.fedtax.repositories.TaxBracketRepository;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FedTaxController {

    private FilingStatusRepository fsrepo;
    private TaxBracketRepository tbrepo;
    private Calculator calculator;

    public FedTaxController(FilingStatusRepository fsrepo, TaxBracketRepository tbrepo, Calculator calculator){
        this.fsrepo = fsrepo;
        this.tbrepo = tbrepo;
        this.calculator = calculator;
    }

    @GetMapping("/")
    public String indexGet(Model model){
        model.addAttribute("filingStatuses", fsrepo.findAll(Sort.by("id").ascending()));
        model.addAttribute("taxYears", tbrepo.getAllTaxYears());

        return "index";
    }

    @PostMapping("/")
    public String indexPost(@RequestParam(name="income") long income,
                            @RequestParam(name="tax_year") int taxYear,
                            @RequestParam(name="filing_status_id") long filingStatusId,
                            Model model){

        FilingStatus filingStatus = fsrepo.getById(filingStatusId);

        CalculatorTotalResult taxResult = calculator.determineTax(income, filingStatus, taxYear);

        model.addAttribute("filingStatuses", fsrepo.findAll(Sort.by("id").ascending()));
        model.addAttribute("taxYears", tbrepo.getAllTaxYears());
        model.addAttribute("taxResult", taxResult);

        return "index";

    }
}
