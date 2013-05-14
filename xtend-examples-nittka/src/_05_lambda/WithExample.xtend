package _05_lambda

import org.junit.Test
import java.util.List
import static org.junit.Assert.*

class Person{
	@Property
	String firstName
	@Property
	String lastName
	@Property
	Person spouse
	@Property
	List<Person>children
}

class WithExample {

	@Test
	def void withExample(){
		val Person person =new Person=>[
			val me=it
			lastName="Smith" 
			firstName="Peter"
			spouse=new Person=>[
				lastName="Brown"
				firstName="Mary"
				spouse=me
			]
			children=newArrayList(
				new Person=>[
					lastName="Smith"
					firstName="John"
				],
				new Person=>[
					lastName="Smith"
					firstName="Clair"
				]
			)
			spouse.children=children
		]

		assertEquals("Smith",person.lastName)
		assertEquals("Peter",person.firstName)
		assertEquals("Mary",person.spouse.firstName)
		assertSame(person,person.spouse.spouse)
		assertEquals(2, person.spouse.children.size)
		assertEquals("Clair",person.children.filter[firstName.contains("a")].head.firstName)
	}
}