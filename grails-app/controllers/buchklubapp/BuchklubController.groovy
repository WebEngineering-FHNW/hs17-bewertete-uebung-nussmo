package buchklubapp

class BuchklubController {

    //static scaffold = Buchklubtreffen

    def startPage() {
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

    def showPage() {
        render view: "showPage";
    }

    def saveevent() {
        def buchklubtreffen = new Buchklubtreffen(params)
        buchklubtreffen.save()
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

}
