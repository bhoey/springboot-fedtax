package com.bhoey.demo.springboot.fedtax.controllers;

import com.bhoey.demo.springboot.fedtax.Calculator;
import com.bhoey.demo.springboot.fedtax.CalculatorTotalResult;
import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import com.bhoey.demo.springboot.fedtax.repositories.FilingStatusRepository;
import com.bhoey.demo.springboot.fedtax.repositories.TaxBracketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FedTaxController {

    @Autowired
    private FilingStatusRepository fsrepo;

    @Autowired
    private TaxBracketRepository tbrepo;

    @Autowired
    private Calculator calculator;

    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("filingStatuses", fsrepo.findAll(Sort.by("id").ascending()));
        model.addAttribute("taxYears", tbrepo.getAllTaxYears());
        return "index";
    }

    @PostMapping("/process_form")
    public String processForm(@RequestParam long income,
                              @RequestParam int tax_year,
                              @RequestParam long filing_status_id,
                              Model model){

        FilingStatus filingStatus = fsrepo.getById(filing_status_id);

        CalculatorTotalResult taxResult = calculator.determineTax(income, filingStatus, tax_year);

        model.addAttribute("filingStatuses", fsrepo.findAll(Sort.by("id").ascending()));
        model.addAttribute("taxYears", tbrepo.getAllTaxYears());
        model.addAttribute("taxResult", taxResult);

        return "index";

    }
}
