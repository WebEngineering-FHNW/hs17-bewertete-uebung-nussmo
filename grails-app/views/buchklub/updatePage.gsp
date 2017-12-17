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
                    <tmpl:book_template/>
                    <ul>
                        <li>
                            <label>Beschreibung:  </label>
                            <textarea id="bookdescription" name = "bookdescription" onchange="checkOk()" rows="4" cols="50"></textarea>
                        </li>
                    </ul>
                    <tmpl:organisation_template/>
                    <ul>
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
