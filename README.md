# Fed Tax Spring Boot Demo

## Purpose
This is a demo to showcase the following technologies working together: 

* Spring Boot
* Spring JPA
* Apache Freemarker
* BootStrap 4
* H2 Database

## Project Description
The US Federal Government uses a [marginal tax rate](https://en.wikipedia.org/wiki/Tax_rate#Marginal) to determine the
amount of income tax owed each year. This program preloads the tax tables for 2019 and 2020 into an in-memory database
on startup then provides a web GUI to calculate per-bracket and total tax based off entered
income and filing status.

## Running Program
```
mvn spring-boot:run
```

## Interacting With The Program
Browse to http://localhost:8082 and enter different values to see the results.

## Interacting H2
Additionally the H2 Web Console has been enabled with the following application.properties entries: 

```
spring.h2.console.enabled=true
spring.h2.console.path=/h2
```
To access the console browse to http://localhost:8082/h2. The connection settings should match what is set in application.properties. 

