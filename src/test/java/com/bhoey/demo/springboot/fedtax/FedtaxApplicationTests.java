package com.bhoey.demo.springboot.fedtax;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class FedtaxApplicationTests {

    @Test
    void testGet(@Autowired MockMvc mvc) throws Exception {
        mvc.perform(
                get("/"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("<title>US Federal Tax Spring Boot Demo</title>")))
                ;
    }

    @Test
    void testPost(@Autowired MockMvc mvc) throws Exception {
        mvc.perform(
                post("/")
                    .param("income", "100000")
                    .param("taxYear", "2023")
                    .param("filingStatusId", "1")
        )
        .andExpect(status().isOk())
        .andExpect(content().string(containsString("<b>Approx. Federal Income Tax:</b> $17,400<br/>")))
        ;
    }
}