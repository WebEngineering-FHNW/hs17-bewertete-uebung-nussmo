<!doctype html>
<html lang="en" class="no-js">
<head>

    <title>
        Buchklub
    </title>
    <asset:stylesheet src="startPage.css"/>
    <script language="JavaScript">
        function createNewEvent() {
            document.getElementById("newEventForm").style.display = "block";
        }
        function closeForm(){
            document.getElementById("newEventForm").style.display = "none";
        }
    </script>
</head>
<body>

    <div id="title" class="title-container">
        <asset:image src="IMG_4662.JPG" width="360"/>
    </div>

    <div id="events" class="table-container">
        <div id="newEvent">
            <button id="newEventButton" onclick="createNewEvent()">Neuer Event</button>
            <div id="newEventForm">
                <div id="newEventForm-content">
                    <span class="close" onclick="closeForm()">&times;</span>
                    <form action = "saveevent">
                        <h2>Neuen Event erfassen</h2>
                        <p>Bitte gebt das Datum, das Buch und euren Namen an. Pflichtfleder sind durch ein <strong><abbr title="required">*</abbr></strong> gekennzeichnet.</p>
                        <section>

                                <legend>Buch</legend>
                                <ul>
                                    <li>
                                        <label>Titel: * </label>
                                        <input id = "booktitle" type="text">
                                    </li>
                                    <li>
                                        <label>Author: * </label>
                                        <input id="bookauthor" type="text">
                                    </li>
                                </ul>
                            <p>
                                <label>Datum: </label>
                                <input id="date" type="date">
                            </p>
                            <p>
                                <label>Name: * </label>
                                <select id="names" name="namen">
                                    <option value="lena">--</option>
                                    <option value="lena">Lena</option>
                                    <option value="linda">Linda</option>
                                    <option value="lara">Lara</option>
                                    <option value="tina">Tina</option>
                                    <option value="fabi">Fabi</option>
                                    <option value="moni">Moni</option>
                                </select>
                            </p>
                        </section>
                        <section>
                            <p> <button class="speichern" type="submit">Speichern</button> </p>
                        </section>
                    </form>
                </div>
            </div>
        </div>
        <div id="pastEvents">
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
        </div>
    </div>

</body>
</html>
