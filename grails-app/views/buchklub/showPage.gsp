<!doctype html>
<html lang="en" class="no-js">
<head>

    <title>
        Buchklub
    </title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <asset:stylesheet src="showPage.css"/>

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
                <th>
                    <a class="update" href="${createLink(controller: 'buchklub', action: 'updatePage', params: [id:treffen.id])}">
                        <span class="glyphicon glyphicon-edit" id="iconupdate"></span>
                    </a>
                </th>
            </tr>
        </table>
    </div>
    <div id="showevent">
        <h2>Buchklubtreffen vom ${treffen.datum.dateString}</h2>

        <h3>Buch</h3>
        <p>Titel: ${treffen.buch.titel}</p>
        <p>Autor: ${treffen.buch.autor}</p>
        <p>Beschreibung (optional): ${treffen.buch.beschreibung}</p>

        <h3>Organisatorisches</h3>
        <p>Verantwortlich: ${treffen.person.name}</p>
        <p>Treffpunkt (optional): ${treffen.treffpunkt}</p>
    </div>

</body>
</html>
