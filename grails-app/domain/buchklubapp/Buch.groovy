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
        titel nullable: false, unique: true
        autor nullable: false
        beschreibung nullable: true
    }
}
