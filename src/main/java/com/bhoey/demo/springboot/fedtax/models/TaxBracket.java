package com.bhoey.demo.springboot.fedtax.models;

import lombok.Data;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.math.BigDecimal;
import javax.persistence.GenerationType;

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
