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
    if(booktitle==""){
        document.getElementById("booktitle").style.borderColor = "red";
    }
    if (author=="") {
        document.getElementById("bookauthor").style.borderColor = "red";
    }
    if(name == ""){
        document.getElementById("names").style.borderColor = "red";
    }
}

function checkDate() {
    var date = document.getElementById("date").value;
    if(date != ""){
        var futureday = new Date(date);
        var today = new Date();
        if(futureday < today){
            document.getElementById("date").style.borderColor = "red";
        }
    }
}