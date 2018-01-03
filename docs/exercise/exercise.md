# WebEngineering Module, Graded Exercise

## Commit Proposal

Matriculation Number: 06-050-207

Project idea short description: Mit meinen ehemaligen Klassenkameradinnen
habe ich einen Buchklub gegründet. Wir haben das Problem, dass wir
immer vergessen, wer als nächster dran ist, ein neues Buch vorzuschlagen
und wann genau das nächste Buchklubtreffen ist. Deshalb soll mein Projekt
ein Bucklkub-Management-Tool mit folgenden Funktionalitäten sein:

 * Anzeige wer, welches Buch vorgeschlagen hat und wann das Buchklubtreffen ist
 * neue Einträge (wer, welches Buch, Datum) erfassen
 * Einträge werden persistent in Datenbank gespeichert
 * Anzeige, wer als nächster dran ist ein Buch vorzuschlagen
 * auf einer weiteren Seite können optional Fotos oder Kommentare 
 zu den einzelnen Treffen hochgeladen werden und zu den Einträgen auf der ersten 
 Seite verlinkt werden


## Project confirmation

Confirmed.

Coole Idee! Ich könnte ein paar Buchvorschläge für SW-Entwicklung beisteuern :-)

## Project delivery <to be filled by student>

How to start the project: (if other than `grailsw run-app`)

How to test the project:  (if other than `grailsw test-app`)

Project description: /static/DescriptionBuchklubapp.html

External contributions:

Other comments: Safari und IE unterstützen das html input feld date nicht.
Somit können bei der Benutzung der App über Safari und IE, anders als z.B. bei
Firefox, im Datumsfeld beliegige Zeichen eingegeben werden. Deshalb musste ich für
das Datumsfeld eine Überprüfung mit REGEX durchführen und ein Abfangen und Weiterleiten
auf eine Fehlerseite einfügen, falls trotz Wahrnung falsch formatierte Datumeingaben 
bei der Benutzung von Safari entstehen. 

I'm particular proud of:


## Project grading 

Description is ok and fully valid. The style with divs and ids is ok, while the use
of semantic tags would have been even nicer.
The application works nicely.

Functionality: 
Basic Master-Detail Navigation. CRUD user input. 
Very nice input validation with client-side interactivity on value change.
Small domain with two entities and one relation.

Engineering:
Proper commit log.
Nicely done tests! (I first expected some more integration tests but you managed
to test all important pieces via unit tests. This is even better!)
The HTML is using a duplication of ids for iconshow, iconupdate, iconremove.
Comments are ok (a bit sparse in the domain/controller part but nice in the JS code.)
Naming is ok.
Duplication is nicely factored out into templates.
Side note: in industrial-strength applications, one would be a little bit more defensive
when accessing request parameters in the controller as they might not be supplied.

Since we already hit the ceiling, I spare the effort of grading any extra points.

Congratulations!
You created a full, distributed, DB-backed, interactive web application from scratch
all on your own. Moreover, you included comprehensive testing and you have shown 
very good engineering practices particularly in testing, commits, and factorization! 
If you ever need to show some of your work when applying for a job, you can use
this project as an example. 

Total grade: 6.0



