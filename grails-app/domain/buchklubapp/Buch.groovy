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
        titel nullable: false, maxSize: 255, unique: true
        autor nullable: false, maxSize: 255
        beschreibung nullable: true, maxSize: 255
    }
}
