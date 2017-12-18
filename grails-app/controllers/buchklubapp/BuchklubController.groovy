package buchklubapp

import java.text.SimpleDateFormat

class BuchklubController {

    static scaffold = Buchklubtreffen

    //static defination of error messages
    static final String PERSONERROR ="Oje, die Person, die sie gewählt haben, existiert nicht mehr in der Datenbank. Wenden Sie sich bitte an den Administrator."
    static final String BOOKERROR ="Das Buch ist schon vorgeschlagen worden oder der Titel ist zu lang. Bitte wählen Sie ein anderes Buch."
    static final String DATEERROR ="Ihre Datumseingabe hat einen Fehler geworfen. Das Datum muss folgendes Format haben: yyyy-mm-dd "


    def startPage() {
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

    def showPage(int id) {
        render view: "showPage", model: [treffen: Buchklubtreffen.findById(id)];
    }

    def updatePage(int id){
        render view: "updatePage", model: [treffen: Buchklubtreffen.findById(id)];
    }

    def saveevent(ErrorModel errormodel) {
        Person p = Person.findByName(params.namen)
        // check whether person is in database
        if(p == null){
            errormodel.message = PERSONERROR
            render view:'errorPage', model: [errorInstance: errormodel]
            return
        }
        Buch b = new Buch(titel: params.booktitle , autor: params.bookauthor).save()
        //check whether creating a new book was successfull
        if(b == null){
            errormodel.message = BOOKERROR
            render view:'errorPage', model: [errorInstance: errormodel]
            return
        }
        Date d;
        //catch wrongly formatted dates
        try {
            d = new SimpleDateFormat("yyyy-MM-dd").parse params.date
        }catch(err) {
            errormodel.message = DATEERROR
            render view:'errorPage', model: [errorInstance: errormodel];
            return
        }
        if(d == null){
            errormodel.message = DATEERROR
            render view:'errorPage', model: [errorInstance: errormodel]
            return
        }
        def buchklubtreffen = new Buchklubtreffen(params)
        buchklubtreffen.setPerson(p)
        buchklubtreffen.setBuch(b)
        buchklubtreffen.setDatum(d)
        buchklubtreffen.save()
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

    def updateevent(ErrorModel errormodel){
        Buchklubtreffen treffen = Buchklubtreffen.findById(params.id)
        //check whether buchklubtreffen was found in database
        if(treffen == null){
            render view: "startPage", model: [treffen: Buchklubtreffen.list()]
        }
        Person p = Person.findByName(params.namen)
        // check whether person is in database
        if(p == null){
            errormodel.message = PERSONERROR
            render view:'errorPage', model: [errorInstance: errormodel]
            return
        }
        Buch b = Buch.findByTitel(params.booktitle)
        //check whether book is in database
        if(b == null){
            errormodel.message = BOOKERROR
            render view:'errorPage', model: [errorInstance: errormodel]
            return
        }
        b.setAutor(params.bookauthor)
        b.setBeschreibung(params.bookdescription)
        b.save(flush: true)
        Date d;
        //catch wrongly formatted dates
        try {
            d = new SimpleDateFormat("yyyy-MM-dd").parse params.date
        }catch(err) {
            errormodel.message = DATEERROR
            render view:'errorPage', model: [errorInstance: errormodel];
            return
        }
        if(d == null){
            errormodel.message =  DATEERROR
            render view:'errorPage', model: [errorInstance: errormodel]
            return
        }
        treffen.setPerson(p)
        treffen.setBuch(b)
        treffen.setDatum(d)
        treffen.setTreffpunkt(params.meetingpoint)
        treffen.save(flush: true)
        render view: "startPage", model: [treffen: Buchklubtreffen.list()]
    }

    def delete(){
        def treffen = Buchklubtreffen.get(params.id)
        if(treffen == null){
            render view: "startPage", model: [treffen: Buchklubtreffen.list()]
        }
        treffen.delete(flush: true)
        render view: "startPage", model: [treffen: Buchklubtreffen.list()]
    }

}

class ErrorModel {
    String message = ""
}

