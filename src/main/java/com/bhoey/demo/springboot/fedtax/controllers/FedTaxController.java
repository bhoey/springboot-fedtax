package com.bhoey.demo.springboot.fedtax.controllers;

import com.bhoey.demo.springboot.fedtax.Calculator;
import com.bhoey.demo.springboot.fedtax.CalculatorTotalResult;
import com.bhoey.demo.springboot.fedtax.dtos.FormInputDTO;
import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import com.bhoey.demo.springboot.fedtax.repositories.FilingStatusRepository;
import com.bhoey.demo.springboot.fedtax.repositories.TaxBracketRepository;
import jakarta.validation.Valid;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
    public String indexPost(@Valid FormInputDTO formInputDTO,
                            Model model){

        FilingStatus filingStatus = fsrepo.getById(formInputDTO.getFilingStatusId());

        CalculatorTotalResult taxResult = calculator.determineTax(formInputDTO.getIncome(), filingStatus, formInputDTO.getTaxYear());

        model.addAttribute("filingStatuses", fsrepo.findAll(Sort.by("id").ascending()));
        model.addAttribute("taxYears", tbrepo.getAllTaxYears());
        model.addAttribute("taxResult", taxResult);

        return "index";
    }
}
