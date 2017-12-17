function checkNotNullAndLength() {
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

function checkDate() {
    var date = document.getElementById("date").value;
    if(date != ""){
        var futureday = new Date(date);
        var today = new Date();
        if(futureday < today){
            alert("Vorsicht! Das Datum liegt in der Vergangenheit. Sind Sie sicher, dass Sie dieses Datum wählen wollen?");
            document.getElementById("date").style.borderColor = "red";
        }
        //https://www.regexpal.com/96683
        const pattern = /^([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/;
        if (!pattern.test(date)) {
            alert("Das Datum hat ein falsches Format! Bitte yyyy-mm-dd verwenden. Bei Nichtbeachtung der Warnung können falsche Daten gespeichert werden.");
            document.getElementById("date").style.borderColor = "red";
        }else{
            document.getElementById("date").style.borderColor = "green";
        }
    }
}

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

    var bookdescription = document.getElementById("bookdescription").value;
    var meetingpoint = document.getElementById("meetingpoint").value;
    if(bookdescription != "" && bookdescription.length < 255){
        document.getElementById("bookdescription").style.borderColor = "green";
    }
    if(meetingpoint != "" && meetingpoint.length < 255){
        document.getElementById("meetingpoint").style.borderColor = "green";
    }
}

function fillFields(titel, author, description, datum, name, treffpunkt) {
    document.getElementById("booktitle").value = titel;

    document.getElementById("bookauthor").value = author;
    if(description != 'null'){
        document.getElementById("bookdescription").value = description;
    }
    //https://stackoverflow.com/questions/1001937/auto-insert-date-and-time-in-form-input-field
    var date = datum;
    var day = date.substr(0,2);
    var month = date.substr(3,2);
    var year = date.substr(6,2);
    year = "20" + year;
    var tempdate = year + "-" + month + "-" + day;
    document.getElementById("date").value = tempdate;
    //https://stackoverflow.com/questions/7373058/changing-the-selected-option-of-an-html-select-element
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
