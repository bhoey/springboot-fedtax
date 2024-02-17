<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>US Federal Tax Spring Boot Demo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-4 mb-4">US Federal Tax Spring Boot Demo</h1>
        <form class="form-inline mb-4" action="" method="POST">
            <div class="form-group">
                <label for="income" class="col-form-label">Income:</label>
                <div class="col">
                    <input type="text" id="income" class="form-control"  name="income" value="${(taxResult.income?c)!""}" />
                </div>
            </div>
            <div class="form-group">
                <label for="filing_status" class="col-form-label">Filing Status:</label>
                <div class="col">
                    <select name="filing_status_id" id="filing_status" class="form-control">
                        <#list filingStatuses as filingStatus>
                            <#if taxResult?has_content && taxResult.filingStatus.id == filingStatus.id>
                                <option value="${filingStatus.id?c}" selected>${filingStatus.name}</option>
                             <#else>
                                 <option value="${filingStatus.id?c}">${filingStatus.name}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="tax_year" class="col-form-label">Tax Year:</label>
                <div class="col">
                    <select name="tax_year" id="tax_year" class="form-control">
                        <#list taxYears as taxYear>
                            <#if taxResult?has_content && taxResult.taxYear == taxYear>
                                <option selected>${taxYear?c}</option>
                            <#else>
                                <option>${taxYear?c}</option>
                            </#if>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col">
                    <button type="submit" class="form-control">Submit</button>
                </div>
            </div>
        </form>

        <#if taxResult?has_content>
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

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>