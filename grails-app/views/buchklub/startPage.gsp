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
                                <legend>Buch</legend>
                                <ul>
                                    <li>
                                        <label>Titel: * </label>
                                        <input id = "booktitle" name="booktitle" type="text" required>
                                    </li>
                                    <li>
                                        <label>Author: * </label>
                                        <input id="bookauthor" name="bookauthor" type="text" required>
                                    </li>
                                </ul>
                        </section>
                        <section>
                            <legend>Organisatorisches</legend>
                            <ul>
                                <li>
                                    <label>Datum: * </label>
                                    <input id="date" name = "date" type="date" onchange="checkDate()" required>
                                </li>
                                <li>
                                    <label>Name: * </label>
                                    <select id="names" name="namen" required>
                                        <option disabled selected value>--</option>
                                        <option value="Lena">Lena</option>
                                        <option value="Linda">Linda</option>
                                        <option value="Lara">Lara</option>
                                        <option value="Tina">Tina</option>
                                        <option value="Fabi">Fabi</option>
                                        <option value="Moni">Moni</option>
                                    </select>
                                </li>
                            </ul>
                        </section>
                        <section>
                            <p> <button class="speichern" type="submit" onclick="checkNotNull()">Speichern</button> </p>
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











