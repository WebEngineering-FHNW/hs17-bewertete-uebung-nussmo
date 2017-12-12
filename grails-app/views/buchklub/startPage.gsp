<!doctype html>
<html lang="en" class="no-js">
<head>

    <title>
        Buchklub
    </title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <asset:stylesheet src="startPage.css"/>
    <asset:javascript src="startPage.js"/>
    <asset:javascript src="createPage.js"/>


</head>
<body>

    <tmpl:headerPage_template/>

    <div id="events" class="table-container">
        <div id="newEvent">
            <button id="newEventButton" onclick="createNewEvent()">Neuer Event</button>
            <tmpl:createPage_template/>
        </div>
        <div id="pastEvents">
            <table id="mainTable">
                <tr class="header">
                    <th style="width:19%;">Datum</th>
                    <th style="width:40%;">Buch</th>
                    <th style="width:20%;">Name</th>
                    <th style="width:7%"></th>
                    <th style="width:7%"></th>
                    <th style="width:7%"></th>
                </tr>
                <g:each var="t" in="${treffen}">
                    <tr class="content">
                        <th style="font-weight: lighter">${t.datum.dateString}</th>
                        <th style="font-weight: lighter">${t.buch.titel} von ${t.buch.autor}</th>
                        <th style="font-weight: lighter">${t.person.name}</th>
                        <th style="font-weight: lighter">
                            <a class="show" href="${createLink(controller: 'buchklub', action: 'showPage', params: [id:t.id])}">
                                <span class="glyphicon glyphicon-zoom-in"></span>
                            </a>
                        </th>
                        <th style="font-weight: lighter">
                            <a class="update" href="${createLink(controller: 'buchklub', action: 'updatePage', params: [id:t.id])}">
                                <span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </th>
                        <th style="font-weight: lighter">
                            <a class="delete" href="${createLink(controller: 'buchklub', action: 'delete', params: [id:t.id])}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </th>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</body>
</html>
