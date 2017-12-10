function checkNotNull() {
    var booktitle = document.getElementById("booktitle").value;
    var author = document.getElementById("bookauthor").value;
    var name = document.getElementById("names").value;
    if(booktitle==""){
        document.getElementById('booktitle').style.borderColor = "red";
    }
    if (author=="") {
        document.getElementById('bookauthor').style.borderColor = "red";
    }
    if(name == ""){
        document.getElementById('names').style.borderColor = "red";
    }
    if(booktitle!=""){
        document.getElementById('booktitle').style.border = "1px solid";
        document.getElementById('booktitle').style.borderColor = "green";
    }
    if (author!="") {
        document.getElementById('bookauthor').style.border = "1px solid";
        document.getElementById('bookauthor').style.borderColor = "green";
    }
    if(name!=""){
        document.getElementById('names').style.borderColor = "green";
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