package buchklubapp

import javax.annotation.Resource

@Resource
class Person {
	String name
	
	String toString() {
		return name
	}

	static constraints = {
		name nullable: false, maxSize: 255, unique: true
	}
}