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
        Buchklubtreffen treffen = Buchklubtreffen.findById(params.id)
        //treffen found?
        Person p = Person.findByName(params.namen)
        Buch b = Buch.findByTitel(params.booktitle)
        b.setAutor(params.bookauthor)
        b.setBeschreibung(params.bookdescription)
        b.save(flush: true)
        Date d = new SimpleDateFormat("yyyy-MM-dd").parse params.date

        treffen.setPerson(p)
        treffen.setBuch(b)
        treffen.setDatum(d)
        treffen.setTreffpunkt(params.meetingpoint)
        treffen.setDoodlelink(params.doodlelink)
        println(treffen)
        treffen.save(flush: true)
        render view: "startPage", model: [treffen: Buchklubtreffen.list()]
    }

    def delete(){
        def treffen = Buchklubtreffen.get(params.id)
        treffen.delete(flush: true)
        render view: "startPage", model: [treffen: Buchklubtreffen.list()]
    }

}
