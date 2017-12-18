/*open the modal form when newEventButton is pressed*/
function createNewEvent() {
    document.getElementById("newEventForm").style.display = "block";
}

/*close the modal form when X is pressed*/
function closeForm(){
    document.getElementById("newEventForm").style.display = "none";
}

/*give the user visual (red) feedback if input is incorrect*/
function checkNotEmpty() {
    var booktitle = document.getElementById("booktitle").value;
    var author = document.getElementById("bookauthor").value;
    var name = document.getElementById("names").value;
    var date = document.getElementById("date").value;
    if(booktitle==""){
        document.getElementById("booktitle").style.borderColor = "red";
    }
    if (author=="") {
        document.getElementById("bookauthor").style.borderColor = "red";
    }
    if(name == ""){
        document.getElementById("names").style.borderColor = "red";
    }
    if(date == ""){
        document.getElementById("date").style.borderColor = "red";
    }
    if(booktitle.length > 255){
        alert("Buchtitel zu lang. Der Titel wird nicht gespeichert");
        document.getElementById("booktitle").style.borderColor = "red";
    }
    if(author.length > 255){
        alert("Autorenname zu lang. Der Name wird nicht gespeichert");
        document.getElementById("names").style.borderColor = "red";
    }
}

/*extend checkNotEmpty-function with update fields, give the user visual (red) feedback if input is incorrect*/
function checkNotEmptyUpdate() {
    checkNotEmpty();
    var bookdescription = document.getElementById("bookdescription").value;
    var meetingpoint = document.getElementById("meetingpoint").value;
    if(bookdescription.length > 255){
        alert("Buchbeschreibung zu lang. Die Beschreibung wird nicht gespeichert");
        document.getElementById("bookdescription").style.borderColor = "red";
    }
    if(meetingpoint.length > 255){
        alert("Treffpunkt zu lang. Der Treffpunkt wird nicht gespeichert");
        document.getElementById("meetingpoint").style.borderColor = "red";
    }
}

/*Safari and IE do not support input type = "date". Therefore a Regex-check for correct formatting is needed.
* inform the user if date is in past.*/
function checkDate() {
    var date = document.getElementById("date").value;
    if(date != ""){
        var futureday = new Date(date);
        var today = new Date();
        if(futureday < today){
            alert("Vorsicht! Das Datum liegt in der Vergangenheit. Sind Sie sicher, dass Sie dieses Datum wählen wollen?");
            document.getElementById("date").style.borderColor = "red";
        }
        //EXTERNAL: https://www.regexpal.com/96683
        const pattern = /^([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/;
        if (!pattern.test(date)) {
            alert("Das Datum hat ein falsches Format! Bitte yyyy-mm-dd verwenden. Bei Nichtbeachtung der Warnung können falsche Daten gespeichert werden.");
            document.getElementById("date").style.borderColor = "red";
        }else{
            document.getElementById("date").style.borderColor = "green";
        }
    }
}

/*give user visual (green) feedback if input is correct*/
function checkOk(){
    var booktitle = document.getElementById("booktitle").value;
    var author = document.getElementById("bookauthor").value;
    var name = document.getElementById("names").value;
    var date = document.getElementById("date").value;
    if(booktitle!="" && booktitle.length < 255){
        document.getElementById("booktitle").style.borderColor = "green";
    }
    if (author!="" && author.length < 255) {
        document.getElementById("bookauthor").style.borderColor = "green";
    }
    if(name != ""){
        document.getElementById("names").style.borderColor = "green";
    }
    if(date != ""){
        document.getElementById("date").style.borderColor = "green";
    }
}

/*extends checkOK-function with update fields, give user visual (green) feedback if input is correct*/
function checkOkUpdate(){
    checkOk();
    var bookdescription = document.getElementById("bookdescription").value;
    var meetingpoint = document.getElementById("meetingpoint").value;
    if(bookdescription != "" && bookdescription.length < 255){
        document.getElementById("bookdescription").style.borderColor = "green";
    }
    if(meetingpoint != "" && meetingpoint.length < 255){
        document.getElementById("meetingpoint").style.borderColor = "green";
    }
}

/*fill fields in update form with respective data from database*/
function fillFields(titel, author, description, datum, name, treffpunkt) {
    document.getElementById("booktitle").value = titel;

    document.getElementById("bookauthor").value = author;
    if(description != 'null'){
        document.getElementById("bookdescription").value = description;
    }
    //EXTERNAL: https://stackoverflow.com/questions/1001937/auto-insert-date-and-time-in-form-input-field
    var date = datum;
    var day = date.substr(0,2);
    var month = date.substr(3,2);
    var year = date.substr(6,2);
    year = "20" + year;
    var tempdate = year + "-" + month + "-" + day;
    document.getElementById("date").value = tempdate;

    var tempname = name;
    var selection = document.getElementById("names");
    var options = selection.options;
    for(var o, j = 0; o = options[j]; j++){
        if(o.value == tempname){
            selection.selectedIndex = j;
            break;
        }
    }
    if(treffpunkt != 'null'){
        document.getElementById("meetingpoint").value = treffpunkt;
    }
}