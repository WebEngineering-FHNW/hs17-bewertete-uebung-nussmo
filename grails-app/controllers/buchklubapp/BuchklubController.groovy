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
        if(p == null){
            render view:'personError';
            return
        }
        Buch b = new Buch(titel: params.booktitle , autor: params.bookauthor).save()
        if(b == null){
            render view: 'bookError';
            return
        }
        Date d;
        try {
            d = new SimpleDateFormat("yyyy-MM-dd").parse params.date
        }catch(err) {
            render view: 'dateError';
            return
        }
        if(d == null){
            render view: 'dateError';
            return
        }
        def buchklubtreffen = new Buchklubtreffen(params)
        buchklubtreffen.setPerson(p)
        buchklubtreffen.setBuch(b)
        buchklubtreffen.setDatum(d)
        buchklubtreffen.save()
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

    def updateevent(){
        Buchklubtreffen treffen = Buchklubtreffen.findById(params.id)
        if(treffen == null){
            render view: "startPage", model: [treffen: Buchklubtreffen.list()]
        }
        Person p = Person.findByName(params.namen)
        if(p == null){
            render view:'personError';
            return
        }
        Buch b = Buch.findByTitel(params.booktitle)
        if(b == null){
            render view: 'bookError';
            return
        }
        def test = params.bookauthor
        b.setAutor(params.bookauthor)
        b.setBeschreibung(params.bookdescription)
        b.save(flush: true)
        Date d;
        try {
            d = new SimpleDateFormat("yyyy-MM-dd").parse params.date
        }catch(err) {
            render view: 'dateError';
            return
        }
        if(d == null){
            render view: 'dateError';
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
