package buchklubapp

import java.text.SimpleDateFormat

class BuchklubController {

    static scaffold = Buchklubtreffen

    def startPage() {
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

    def showPage(int id) {
        render view: "showPage", model: [treffen: Buchklubtreffen.findById(id)];
    }

    def updatePage(int id){
        render view: "updatePage", model: [treffen: Buchklubtreffen.findById(id)];
    }

    def saveevent() {
        Person p = Person.findByName(params.namen)
        // p found?
        Buch b = new Buch(titel: params.booktitle , autor: params.bookauthor).save()
        Date d = new SimpleDateFormat("yyyy-MM-dd").parse params.date
        def buchklubtreffen = new Buchklubtreffen(params)
        buchklubtreffen.setPerson(p)
        buchklubtreffen.setBuch(b)
        buchklubtreffen.setDatum(d)
        buchklubtreffen.save(failOnError: true)
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

    def updateevent(){
        if(!params.id){
            render view: "updatePage", model: [treffen: Buchklubtreffen.findById(id)];
            return
        }

        def treffen = Buchklubtreffen.get(params.id)


        render view: "startPage", model: [treffen: Buchklubtreffen.list()]
    }

    def delete(){
        def treffen = Buchklubtreffen.get(params.id)
        treffen.delete(flush: true)
        render view: "startPage", model: [treffen: Buchklubtreffen.list()]
    }

}
