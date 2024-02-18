package com.bhoey.demo.springboot.fedtax.models;

import lombok.Data;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import jakarta.persistence.GenerationType;

@Data
@Entity
@Table(name="tax_brackets")
public class TaxBracket {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @Column(name="tax_year", nullable=false)
    private Integer taxYear;

    @Column(name="tax_rate", nullable=false, columnDefinition="Decimal(4,3)")
    private BigDecimal taxRate;

    @ManyToOne
    @JoinColumn(name="filing_status_id", nullable=false)
    private FilingStatus filingStatus;

    @Column(name="lower_bound", nullable=false)
    private Integer lowerBound;

    @Column(name="upper_bound")
    private Integer upperBound;

}
