package com.bhoey.demo.springboot.fedtax.dtos;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

@Data
public class FormInputDTO {

    public final static int MIN_YEAR = 2019;
    public final static int MAX_YEAR = 2023;

    @NotNull(message="Income field cannot be empty")
    @Positive(message="Income must be a positive number")
    private Integer income;

    @NotNull
    @Min(value=MIN_YEAR, message="Tax year must be greater than " + MIN_YEAR)
    @Max(value=MAX_YEAR, message="Tax year must be less than " + MAX_YEAR)
    private Integer taxYear;

    @NotNull
    @Min(value=1, message="Invalid filing status")
    private Long filingStatusId;
}