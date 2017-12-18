package buchklubapp

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(BuchklubController)
@Mock([Buchklubtreffen, Person, Buch])
class BuchklubControllerSpec extends Specification {
    BuchklubController buchklubController
    ErrorModel errorModel;

    def setup() {
        buchklubController = new BuchklubController()
        errorModel = new ErrorModel()
        Person lena = new Person(name: "Lena").save(flush: true)
    }

    def cleanup() {
    }

    @Unroll
    void "call the starting page"() {
        when:
        buchklubController.startPage()

        then:
        view == '/buchklub/startPage'
    }

    /*test create new event*/

    /*correct input*/
    @Unroll
    void "test saving a new treffen"() {
        when:
        params.booktitle = "Titel"
        params.bookauthor = "Author"
        params.namen = "Lena";
        params.date = "2017-12-24"

        buchklubController.saveevent()

        then:
        view == '/buchklub/startPage'

    }

    /*title too long*/
    @Unroll
    void "test saving too long title"() {
        when:
        params.booktitle = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lore"
        params.bookauthor = "Author"
        params.namen = "Lena";
        params.date = "2017-12-24"

        buchklubController.saveevent()

        then:
        view == '/buchklub/errorPage'

    }

    /*author too long*/
    @Unroll
    void "test saving too long author"() {
        when:
        params.booktitle = "Titel"
        params.bookauthor = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lore"
        params.namen = "Lena";
        params.date = "2017-12-24"

        buchklubController.saveevent()

        then:
        view == '/buchklub/errorPage'

    }

    /*not existing person*/
    @Unroll
    void "test saving not existing person"() {
        when:
        params.booktitle = "Titel"
        params.bookauthor = "Author"
        params.namen = "Mia";
        params.date = "2017-12-24"

        buchklubController.saveevent()

        then:
        view == '/buchklub/errorPage'

    }

    /*wrongly formatted date*/
    @Unroll
    void "test saving wrong date"() {
        when:
        params.booktitle = "Titel"
        params.bookauthor = "Author"
        params.namen = "Mia";
        params.date = "24.12.2017"

        buchklubController.saveevent()

        then:
        view == '/buchklub/errorPage'
    }

}
