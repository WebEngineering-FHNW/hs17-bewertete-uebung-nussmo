package buchklubapp

import javax.annotation.Resource

@Resource
class Buch {

    String titel
    String autor
    String beschreibung

    String toString() {
        return titel + ", " + autor + ", " + beschreibung
    }
    static constraints = {
        titel blank: false, unique: true
        autor blank: false
        beschreibung nullable: true
    }
}
