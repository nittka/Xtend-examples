package _05_lambda

import org.eclipse.xtext.xbase.lib.IterableExtensions
import org.junit.Test

import static extension java.lang.Integer.*
import static org.junit.Assert.*

class LambdaExample{

	val exampleObjects=newArrayList("4",3,true,"9")

	def void doSomething(Object o){}

	def void illustrateEquivalentNotations(){
		//verbose variant
		IterableExtensions::forEach(exampleObjects,[Object o|doSomething(o)])

		//use forEach as extension method
		exampleObjects.forEach([Object o|doSomething(o)])

		//pull out the last lambda expression
		exampleObjects.forEach()[Object o|doSomething(o)]

		//omit empty parentheses
		exampleObjects.forEach[Object o|o.doSomething]

		//use implicit variable it
		exampleObjects.forEach[Object it|it.doSomething]

		//and omit it
		exampleObjects.forEach[Object it|doSomething]

		//omit Variable declaration (as it can be inferred)
		exampleObjects.forEach[doSomething]

		//not every possible "simplification" improves readability
		mySpecialApply("x","y",[a,b|a+b+a+b])
		"x".mySpecialApply("y")[a,b|a+b+a+b]
	}

	def mySpecialApply(String s1, String s2, (String,String)=>String function1){
		function1.apply(s1,s2)
	}

	@Test
	def void lambdaExample2(){
		assertArrayEquals(newArrayList(5, 8, 11),(1..3).map[it*3+2])
		assertEquals(3,exampleObjects.filter(typeof(Number)).toList.get(0))
		assertFalse((1..10).exists[it>10])
		assertTrue((1..10).forall[it<11])
		assertEquals(6, (1..10).findFirst[it>5])
		assertEquals(4, (1..10).findLast[it<5])
		assertEquals(30,(1..10).filter[it%2==0].reduce[i1,i2|i1+i2])


		//just for completeness
		assertEquals(1,(1..10).head)
		assertEquals(10,(1..10).last)
		assertEquals("2, 3, 4, 5",(1..5).tail.join(', '))
		assertEquals("1, 2, 3, 4, 5",(1..10).take(5).join(', '))
		assertEquals("6, 7, 8, 9, 10",(1..10).drop(5).join(', '))

		//note that the "procedure" may be non-trivial
		exampleObjects.forEach[
			var x=13
			for(y: 1..x){
				if(it.toString.length%y==0){
					doSomething
				}
			}
			//...
		]
	}

	@Test
	def void lambdaExample3(){
		//you can overdo it
		//TODO rewrite using properly named extension methods
		val result=(10..1).map[toString].sortBy[it].fold(0)[i1,String s2|i1 + println(s2).parseInt]
		assertEquals(55,result)
	}
}