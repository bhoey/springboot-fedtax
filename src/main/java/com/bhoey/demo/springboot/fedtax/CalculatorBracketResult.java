package com.bhoey.demo.springboot.fedtax;

import com.bhoey.demo.springboot.fedtax.models.TaxBracket;
import java.math.BigDecimal;
import lombok.Data;

@Data
public class CalculatorBracketResult {
    private TaxBracket bracket;
    private BigDecimal taxOwed;
    private long incomeAffected;
}
