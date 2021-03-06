package buchklubapp

import javax.annotation.Resource
import java.awt.Image

@Resource
class Buchklubtreffen {

    Person person
    Buch buch
    Date datum
    String treffpunkt

    String toString() {
        return person.toString() + datum.toString() + buch.toString() + treffpunkt
    }

    static constraints = {
        buch nullable: false, unique: true
        person nullable: false
        datum nullable: false
        treffpunkt nullable: true, maxSize: 255
    }
}
