package buchklubapp

import javax.annotation.Resource

@Resource
class Buch {

    String titel
    String autor

    String toString() {
        return titel + ", " + autor
    }
    static constraints = {
        titel blank: false, unique: true
        autor blank: false
    }
}
