<!doctype html>
<html lang="en" class="no-js">
<head>

    <title>
        Buchklub
    </title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <asset:stylesheet src="personError.css"/>

</head>
<body>
    <tmpl:headerPage_template/>
    <div id="navigation-content">
        <table id="navigationTable">
            <tr>
                <th>
                    <a class="home" href="${createLink(controller: 'buchklub', action: 'startPage')}">
                        <span class="glyphicon glyphicon-circle-arrow-left" id="iconhome"></span>
                    </a>
                </th>
            </tr>
        </table>
    </div>
    <div id="person-error">
        <output>${errorInstance.message}</output>
    </div>

</body>
</html>
