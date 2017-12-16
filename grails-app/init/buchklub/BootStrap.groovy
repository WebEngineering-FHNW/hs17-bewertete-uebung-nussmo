package buchklub

import buchklubapp.Buch
import buchklubapp.Buchklubtreffen
import buchklubapp.Person
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }

        Person lara = new Person(name: "Lara").save(failOnError: true)
        Person lena = new Person(name: "Lena").save(failOnError: true)
        Person linda = new Person(name: "Linda").save(failOnError: true)
        Person tina = new Person(name: "Tina").save(failOnError: true)
        Person fabienne = new Person(name: "Fabi").save(failOnError: true)
        Person monique = new Person(name: "Moni").save(failOnError: true)

        Buch inColdBlood = new Buch(titel: "In Cold Blood", autor: "Truman Capote").save(failOnError: true)
        Buch fluchtAusLager14 = new Buch(titel: "Flucht aus Lager 14", autor: "Blaine Harden").save(failOnError: true)
        Buch dieDunkelheitIndenBergen = new Buch(titel: "Die Dunkelheit in den Bergen", autor: "Silvio Huonder").save(failOnError: true)

        Buchklubtreffen treffen1 = new Buchklubtreffen(person: lara, buch: inColdBlood, datum: new Date(2017, 01,12)).save(failOnError: true)
        Buchklubtreffen treffen2 = new Buchklubtreffen(person: lena, buch: fluchtAusLager14, datum: new Date(2017, 04, 22)).save(failOnError: true)
        Buchklubtreffen treffen3 = new Buchklubtreffen(person: linda, buch: dieDunkelheitIndenBergen, datum: new Date(2017, 6, 4)).save(failOnError: true)

    }

    static save(domainObject) {
        domainObject.save(failOnError: true)
    }

    def destroy = {
    }
}
