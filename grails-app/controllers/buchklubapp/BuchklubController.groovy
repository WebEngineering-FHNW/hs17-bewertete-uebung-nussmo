package buchklubapp

class BuchklubController {

    def index() {
        render view:'startPage', model: [treffen: Buchklubtreffen.list()]
    }
}
