# Fed Tax Spring Boot Demo

## Purpose
This is a demo to showcase the following technologies working together: 

* Spring Boot
* Spring JPA
* Apache Freemarker
* BootStrap 5
* H2 Database

## Project Description
The US Federal Government uses a [marginal tax rate](https://en.wikipedia.org/wiki/Tax_rate#Marginal) to determine the
amount of income tax owed each year. This program preloads the tax tables for 2019-2023 into an in-memory database
on startup then provides a web GUI to calculate per-bracket and total tax based off entered
income and filing status.

## Live Demo
A live demo of this project is available at https://fedtax-demo.bhoey.com

## Running Program Locally
```
mvn spring-boot:run
```

Then browse to http://localhost:8082 and enter different values to see the results.
![fedtax-screenshot](https://user-images.githubusercontent.com/10429019/90343004-c3427b00-dfda-11ea-9ab8-a9c490023af5.png)

## Examining The H2 Database
Additionally the H2 Web Console can be enabled by uncommentting the following lines in the application.properties file
and restarting Spring Boot: 

```
spring.h2.console.enabled=true
spring.h2.console.path=/h2
```
To access the H2 console afterwards browse to http://localhost:8082/h2. The connection settings should match 
what is set in application.properties.

![fedtax-demo-h2-login](https://user-images.githubusercontent.com/10429019/90343014-d3f2f100-dfda-11ea-965a-70c314cb70f9.png)

![fedtax-demo-h2-query](https://user-images.githubusercontent.com/10429019/90343022-e3723a00-dfda-11ea-8267-b23a1ba4d3eb.png)


## Limitations
* This project does not take into consideration tax credits, deductions or other relevant info required
 to calculate a true Federal tax rate.
