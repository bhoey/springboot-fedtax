package com.bhoey.demo.springboot.fedtax.controllers;

import com.bhoey.demo.springboot.fedtax.Calculator;
import com.bhoey.demo.springboot.fedtax.CalculatorTotalResult;
import com.bhoey.demo.springboot.fedtax.dtos.FormInputDTO;
import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import com.bhoey.demo.springboot.fedtax.repositories.FilingStatusRepository;
import com.bhoey.demo.springboot.fedtax.repositories.TaxBracketRepository;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;
import java.util.stream.Collectors;

@Controller
public class FedTaxController {

    private final Logger logger = LoggerFactory.getLogger(FedTaxController.class);

    private final FilingStatusRepository fsrepo;
    private final TaxBracketRepository tbrepo;
    private final Calculator calculator;

    public FedTaxController(FilingStatusRepository fsrepo, TaxBracketRepository tbrepo, Calculator calculator){
        this.fsrepo = fsrepo;
        this.tbrepo = tbrepo;
        this.calculator = calculator;
    }

    @GetMapping("/")
    public String indexGet(Model model){

        model.addAttribute("filingStatusOptions", getFilingStatusOptions());
        model.addAttribute("taxYearOptions", getTaxYearOptions());
        model.addAttribute("taxResult", new CalculatorTotalResult());

        model.addAttribute("formInputDTO", new FormInputDTO());

        return "index";
    }

    @PostMapping("/")
    public String indexPost(@Valid FormInputDTO formInputDTO,
                            BindingResult bindingResult,
                            Model model){

        model.addAttribute("filingStatusOptions", getFilingStatusOptions());
        model.addAttribute("taxYearOptions", getTaxYearOptions());
        model.addAttribute("taxResult", new CalculatorTotalResult());
        model.addAttribute("formInputDTO", formInputDTO);

        Optional<FilingStatus> filingStatusOpt = fsrepo.findById(formInputDTO.getFilingStatusId());

        if (filingStatusOpt.isEmpty()) {
            bindingResult.rejectValue("filingStatusId", "error.formInputDTO", "Invalid filing status id");
        }

        if (bindingResult.hasErrors()){
            logger.error("Form binding error(s): " + bindingResult);
        }
        else{
            CalculatorTotalResult taxResult = calculator.determineTax(formInputDTO.getIncome(), filingStatusOpt.get(), formInputDTO.getTaxYear());
            model.addAttribute("taxResult", taxResult);
        }

        return "index";
    }

    public Map<String, String> getFilingStatusOptions(){
        Map<String, String> map = new TreeMap<>();
        List<FilingStatus> filingStatusList = fsrepo.findAll(Sort.by("id").ascending());
        for (FilingStatus fs: filingStatusList){
            map.put(fs.getId().toString(), fs.getName());
        }
        return map;
    }

    public List<String> getTaxYearOptions(){
        return tbrepo.getAllTaxYears()
                        .stream()
                        .map(Object::toString)
                        .collect(Collectors.toUnmodifiableList());
    }
}
