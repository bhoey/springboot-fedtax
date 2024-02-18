package com.bhoey.demo.springboot.fedtax.dtos;

import lombok.Data;

@Data
public class FormInputDTO {
    private int income;
    private int taxYear;
    private long filingStatusId;
}
