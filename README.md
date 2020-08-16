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

![fedtax-screenshot](https://user-images.githubusercontent.com/10429019/90343004-c3427b00-dfda-11ea-9ab8-a9c490023af5.png)

## Examining The H2 Database
Additionally the H2 Web Console has been enabled with the following application.properties entries: 

```
spring.h2.console.enabled=true
spring.h2.console.path=/h2
```
To access the console browse to http://localhost:8082/h2. The connection settings should match what is set in application.properties. 

![fedtax-demo-h2-login](https://user-images.githubusercontent.com/10429019/90343014-d3f2f100-dfda-11ea-965a-70c314cb70f9.png)

![fedtax-demo-h2-query](https://user-images.githubusercontent.com/10429019/90343022-e3723a00-dfda-11ea-8267-b23a1ba4d3eb.png)
