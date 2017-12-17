<!doctype html>
<html lang="en" class="update">
<head>

    <title>
        Buchklub
    </title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <asset:stylesheet src="updatePage.css"/>
    <asset:javascript src="updatePage.js"/>

</head>
<body onload="fillFields('${treffen.buch.titel}', '${treffen.buch.autor}', '${treffen.buch.beschreibung}', '${treffen.datum.dateString}', '${treffen.person.name}', '${treffen.treffpunkt}')">

    <tmpl:headerPage_template/>

    <div id="updateEventForm">
        <div id="updateEventForm-content">
            <g:form controller="buchklub" action = "updateevent">
                <a class="delete" href="${createLink(controller: 'buchklub', action: 'startPage')}">
                    <span class="glyphicon glyphicon-remove" id="iconremove"></span>
                </a>
                <h2>Event vom ${treffen.datum.dateString} bearbeiten</h2>
                <p>Pflichtfleder sind durch ein <strong><abbr title="required">*</abbr></strong> gekennzeichnet.</p>
                <section>
                    <h3>Buch</h3>
                    <ul>
                        <li>
                            <label>Titel: * </label>
                            <input id = "booktitle" name = "booktitle" type="text" onchange="checkOk()" required>
                        </li>
                        <li>
                            <label>Author: * </label>
                            <input id="bookauthor" name = "bookauthor" type="text" onchange="checkOk()" required>
                        </li>
                        <li>
                            <label>Beschreibung:  </label>
                            <textarea id="bookdescription" name = "bookdescription" onchange="checkOk()" rows="4" cols="50"></textarea>
                        </li>
                    </ul>
                    <h3>Organisatorisches</h3>
                    <ul>
                        <li>
                            <label>Datum</label>
                            <input id="date" name="date" type="date" onchange="checkDate()" required>
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
                        <li>
                            <label>Treffpunkt</label>
                            <input id="meetingpoint" name="meetingpoint" type="text" onchange="checkOk()">
                        </li>
                    </ul>
                    <ul>
                        <g:hiddenField name="id" value="${treffen.id}"/>
                    </ul>
                </section>
                <section>
                    <p> <button class="updateButton" type="submit" onclick="checkNotNullAndLength()">Speichern</button> </p>
                </section>
            </g:form>
        </div>
    </div>

</body>
</html>
