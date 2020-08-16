package com.bhoey.demo.springboot.fedtax.repositories;

import com.bhoey.demo.springboot.fedtax.models.FilingStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface FilingStatusRepository extends JpaRepository<FilingStatus, Long> {

    @Query("SELECT fs FROM FilingStatus fs WHERE fs.name = :name")
    FilingStatus findByName(@Param("name") String name);

}
