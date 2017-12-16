function createNewEvent() {
    document.getElementById("newEventForm").style.display = "block";
}

function closeForm(){
    document.getElementById("newEventForm").style.display = "none";
}

function checkNotNull() {
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
        }
    }
}
