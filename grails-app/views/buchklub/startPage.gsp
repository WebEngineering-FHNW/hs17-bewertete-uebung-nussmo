<!doctype html>
<html lang="en" class="no-js">
<head>

    <!--TODO: https://www.w3schools.com/html/html_responsive.asp-->

    <title>
        Buchklub
    </title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <asset:stylesheet src="startPage.css"/>
    <asset:javascript src="buchklubapp.js"/>

</head>
<body>

    <tmpl:headerPage_template/>

    <div id="events" class="table-container">
        <div id="newEvent">
            <button id="newEventButton" onclick="createNewEvent()">Neuer Event</button>
            <div id="newEventForm">
                <div id="newEventForm-content">
                    <span class="close" onclick="closeForm()">&times;</span>
                    <g:form controller="buchklub" action = "saveevent">
                        <h2>Neuen Event erfassen</h2>
                        <p>Bitte gebt das Datum, das Buch und euren Namen an. Pflichtfleder sind durch ein <strong><abbr title="required">*</abbr></strong> gekennzeichnet.</p>
                        <section>
                            <tmpl:book_template/>
                        </section>
                        <section>
                            <tmpl:organisation_template/>
                        </section>
                        <section>
                            <p> <button class="speichern" type="submit" onclick="checkNotEmpty()">Speichern</button> </p>
                        </section>
                    </g:form>
                </div>
            </div>
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
                                <span class="glyphicon glyphicon-zoom-in" id="iconshow"></span>
                            </a>
                        </th>
                        <th style="font-weight: lighter">
                            <a class="update" href="${createLink(controller: 'buchklub', action: 'updatePage', params: [id:t.id])}">
                                <span class="glyphicon glyphicon-edit" id="iconupdate"></span>
                            </a>
                        </th>
                        <th style="font-weight: lighter">
                            <a class="delete" href="${createLink(controller: 'buchklub', action: 'delete', params: [id:t.id])}">
                                <span class="glyphicon glyphicon-remove" id="iconremove"></span>
                            </a>
                        </th>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>

</body>
</html>











