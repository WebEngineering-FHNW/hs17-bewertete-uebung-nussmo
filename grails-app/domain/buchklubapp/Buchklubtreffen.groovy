package buchklubapp

import javax.annotation.Resource

@Resource
class Buchklubtreffen {

    Person person
    Buch buch
    Date datum

    String toString() {
        return person.toString() + datum.toString() + buch.toString()
    }

    static constraints = {
    }
}
