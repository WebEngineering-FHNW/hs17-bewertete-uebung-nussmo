package buchklubapp

class BuchklubController {

    //static scaffold = Buchklubtreffen

    def index() {
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }

    def saveevent() {
        def buchklubtreffen = new Buchklubtreffen(params)
        buchklubtreffen.save()
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }
}
