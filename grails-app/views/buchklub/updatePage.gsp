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
    <script language="JavaScript">
    function fillFields() {
        document.getElementById("booktitle").value = "${treffen.buch.titel}";
        document.getElementById("bookauthor").value = "${treffen.buch.autor}";
        document.getElementById("bookdescription").value = "${treffen.buch.beschreibung}";
        //https://stackoverflow.com/questions/1001937/auto-insert-date-and-time-in-form-input-field
        var date = "${treffen.datum.dateString}";
        var day = date.substr(0,2);
        var month = date.substr(3,2);
        var year = date.substr(6,2);
        year = "20" + year;
        var tempdate = year + "-" + month + "-" + day;
        document.getElementById("date").value = tempdate;
        //https://stackoverflow.com/questions/7373058/changing-the-selected-option-of-an-html-select-element
        var tempname = "${treffen.person.name}";
        var selection = document.getElementById("names");
        var options = selection.options;
        for(var o, j = 0; o = options[j]; j++){
            if(o.value == tempname){
                selection.selectedIndex = j;
                break;
            }
        }
        document.getElementById("meetingpoint").value = "${treffen.treffpunkt}";
    }
    </script>

</head>
<body onload="fillFields()">

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
                            <input id = "booktitle" name = "booktitle" type="text" required>
                        </li>
                        <li>
                            <label>Author: * </label>
                            <input id="bookauthor" name = "bookauthor" type="text" required>
                        </li>
                        <li>
                            <label>Beschreibung:  </label>
                            <textarea id="bookdescription" name = "bookdescription" rows="4" cols="50"></textarea>
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
                            <input id="meetingpoint" name="meetingpoint" type="text">
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
