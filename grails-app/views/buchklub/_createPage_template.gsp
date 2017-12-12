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
                        <input id = "booktitle" type="text", required>
                    </li>
                    <li>
                        <label>Author: * </label>
                        <input id="bookauthor" type="text" required>
                    </li>
                </ul>
                <p>
                    <label>Datum: </label>
                    <input id="date" type="date" onchange="checkDate()">
                </p>
                <p>
                    <label>Name: * </label>
                    <select id="names" name="namen" required>
                        <option disabled selected value>--</option>
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
        </g:form>
    </div>
</div>

