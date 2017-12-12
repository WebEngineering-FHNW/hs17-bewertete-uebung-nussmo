<!doctype html>
<html lang="en" class="update">
<head>

    <title>
        Buchklub
    </title>
    <asset:stylesheet src="startPage.css"/>

    <script language="JavaScript">
        function fillFields() {
            document.getElementById("booktitle").value = "${treffen.buch.titel}";
            document.getElementById("bookauthor").value = "${treffen.buch.autor}";
            document.getElementById("bookdescription").value = "${treffen.buch.beschreibung}";
            //https://stackoverflow.com/questions/1001937/auto-insert-date-and-time-in-form-input-field
            var date = new Date("${treffen.datum}");
            var day = date.getDate();
            var month = date.getMonth();
            var year = date.getFullYear();
            if (month < 10) month = "0" + month;
            if (day < 10) day = "0" + day;
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
            document.getElementById("doodlelink").value = "${treffen.doodlelink}";
        }
    </script>

</head>
<body onload="fillFields()">

    <tmpl:headerPage_template/>

    <div id="updateEventForm">
        <div id="updateEventForm-content">

            <g:form controller="buchklub" action = "updateevent">
                <h2>Event vom ${treffen.datum.dateString} bearbeiten</h2>
                <p>Pflichtfleder sind durch ein <strong><abbr title="required">*</abbr></strong> gekennzeichnet.</p>
                <section>
                    <h3>Buch</h3>
                    <ul>
                        <li>
                            <label>Titel: * </label>
                            <input id = "booktitle" type="text" required>
                        </li>
                        <li>
                            <label>Author: * </label>
                            <input id="bookauthor" type="text" required>
                        </li>
                        <li>
                            <label>Beschreibung:  </label>
                            <textarea id="bookdescription" rows="4" cols="50"></textarea>
                        </li>
                    </ul>
                    <h3>Organisatorisches</h3>
                    <ul>
                        <li>
                            <label>Datum</label>
                            <input id="date" type="date">
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
                            <input id="meetingpoint" type="text">
                        </li>
                        <li>
                            <label>Doodlelink zur Terminfindung</label>
                            <input id="doodlelink" type="text">
                        </li>
                    </ul>
                </section>
                <section>
                    <p> <button class="speichern" type="submit">Speichern</button> </p>
                </section>
            </g:form>
        </div>
    </div>

</body>
</html>
