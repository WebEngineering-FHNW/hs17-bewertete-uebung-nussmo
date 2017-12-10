package buchklubapp

import javax.annotation.Resource

@Resource
class Person {
	String name
	
	String toString() {
		return name
	}

	static constraints = {
		name blank: false, unique: true
	}
}