package com.bhoey.demo.springboot.fedtax.repositories;

import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import com.bhoey.demo.springboot.fedtax.models.TaxBracket;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface TaxBracketRepository extends JpaRepository<TaxBracket, Long> {

    @Query("SELECT tb FROM TaxBracket tb WHERE tb.filingStatus = :filingStatus AND tb.taxYear = :taxYear")
    List<TaxBracket> findByFilingStatus(@Param("filingStatus") FilingStatus filingStatus,
                                        @Param("taxYear") int year,
                                        Sort sort
                                        );

    @Query("SELECT DISTINCT(tb.taxYear) FROM TaxBracket tb ORDER BY tb.taxYear DESC")
    List<Integer> getAllTaxYears();

}
