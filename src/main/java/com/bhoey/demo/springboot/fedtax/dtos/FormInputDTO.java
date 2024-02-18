package com.bhoey.demo.springboot.fedtax.dtos;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class FormInputDTO {
    @NotNull
    @Min(1)
    private int income;

    @NotNull
    @Min(2019)
    @Max(2023)
    private int taxYear;

    @NotNull
    @Min(1)
    private long filingStatusId;
}