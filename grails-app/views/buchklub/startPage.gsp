<!doctype html>
<html lang="en" class="no-js">
<head>

    <title>
        Buchklub
    </title>

    <asset:stylesheet src="table.css"/>
</head>
<body>
    <table id="mainTable">
        <tr class="header">
            <th style="width:20%;">Datum</th>
            <th style="width:40%;">Buch</th>
            <th style="width:20%;">Name</th>
            <th style="width:20%">Event</th>
        </tr>
        <g:each var="t" in="${treffen}">
            <tr class="content">
                <th style="font-weight: lighter">${t.datum.dateString}</th>
                <th style="font-weight: lighter">${t.buch.titel} von ${t.buch.autor}</th>
                <th style="font-weight: lighter">${t.person.name}</th>
                <th style="font-weight: lighter">link</th>
            </tr>
        </g:each>
    </table>

</body>
</html>
