<#import "/spring.ftl" as spring/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>US Federal Tax Spring Boot Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script>
        let errors = [];

        function addError(error) {
            errors.push(error);
        }

        function displayErrors(){
            const div = document.getElementById("errorDiv");

            if (errors.length > 0) {
                const header = document.createElement("h3");
                header.appendChild(document.createTextNode("Validation Errors"));
                header.classList.add("text-danger");
                div.appendChild(header);

                const ul = document.createElement("ul");
                div.appendChild(ul);

                for (let i = 0; i < errors.length; i++) {
                    const li = document.createElement("li");
                    li.appendChild(document.createTextNode(errors[i]));
                    li.classList.add("text-danger");
                    ul.appendChild(li);
                }
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-4 mb-4">US Federal Tax Spring Boot Demo</h1>

        <form class="d-flex flex-row align-items-center flex-wrap mb-3" action="" method="POST">
            <div class="row">
                <div class="col-auto align-self-center">
                    <label for="income">Income:</label>
                </div>
                <div class="col-2">
                    <div class="input-group">
                        <@spring.formInput "formInputDTO.income" "class=\"form-control\""/>
                        <#list spring.status.errorMessages as error>
                            <script>addError("${error}")</script>
                        </#list>
                    </div>
                </div>

                <div class="col-auto align-self-center">
                    <label for="filing_status">Filing Status:</label>
                </div>
                <div class="col-auto">
                    <div class="input-group">
                        <@spring.formSingleSelect "formInputDTO.filingStatusId", filingStatusOptions, "class=\"form-select\""/>
                        <#list spring.status.errorMessages as error>
                            <script>addError("${error}")</script>
                        </#list>
                    </div>
                </div>

                <div class="col-auto align-self-center">
                    <label for="taxYear">Tax Year:</label>
                </div>
                <div class="col-auto align-self-center">
                    <div class="input-group">
                        <@spring.formSingleSelect "formInputDTO.taxYear", taxYearOptions, "class=\"form-select\""/>
                        <#list spring.status.errorMessages as error>
                            <script>addError("${error}")</script>
                        </#list>
                    </div>
                </div>

                <div class="col-auto align-self-center">
                    <button type="submit" class="form-control">Submit</button>
                </div>
            </div>
        </form>

        <div id="errorDiv"/>
        <script>displayErrors()</script>

        <#if taxResult?has_content && taxResult.bracketTaxes?has_content>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Bracket</th>
                        <th>Income Range</th>
                        <th>Income Taxed At Bracket</th>
                        <th>Tax Owed For Bracket</th>
                    </tr>
                </thead>
            <#list taxResult.bracketTaxes as taxBracket>
                <tr>
                    <#assign bracket = taxBracket.bracket>
                    <#assign taxAtBracket = taxBracket.taxOwed>
                    <td>${bracket.taxRate?string.percent}</td>
                    <td>${bracket.lowerBound?string("$,##0")} - ${(bracket.upperBound?string("$,##0"))!"Higer"}</td>
                    <td>${taxBracket.incomeAffected?string("$,##0")}</td>
                    <td>${taxAtBracket?string("$,##0")}</td>
                </tr>
            </#list>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><b>Total Tax</b></td>
                    <td><b>${taxResult.totalTax?string("$,##0")}</b></td>
                </tr>
            </table>
            <p>
                <b>Entered Income:</b> ${taxResult.income?string("$,##0")}<br/>
                <b>Filing Status:</b> ${taxResult.filingStatus.name}<br/>
                <b>Approx. Federal Income Tax:</b> ${taxResult.totalTax?string("$,##0")}<br/>
                <b>Effective Tax Rate:</b> ${taxResult.effTaxRate?string.percent}<br/>
            </p>
        </#if>

        <p class="text-center mt-4">
            This information is for demonstration purposes only and is provided 'AS IS' without warranty of any kind, express or implied.
        </p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>
</html>