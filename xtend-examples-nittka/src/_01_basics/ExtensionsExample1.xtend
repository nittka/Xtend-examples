package _01_basics

import org.junit.Test
import java.math.BigDecimal

import static org.junit.Assert.*

//simple class used in the later example
class DummyClass{
	private var Object o
	//constructors
	new(){}
	new(Object initialValue){
		setTheObject(initialValue)
	}
	def setTheObject(Object o){
		this.o = o
	}
	def getTheObject(){
		o
	}
}






class ExtensionsExample1 {

	@Test
	def void basicExample(){
		//be sure to have a look at the exmples shipped with Xtend as well!

		//final variable
		val initialValue=new Object()
		//trying to assign a different value will fail
		//use var instead of val for non-final variables
//		initialValue=new Object()

		val basics=new DummyClass(initialValue)

		assertSame(initialValue, basics.getTheObject())
		//empty parentheses can be omitted
		assertSame(initialValue, basics.getTheObject)
		//prefix get can be omitted for getters
		assertSame(initialValue, basics.theObject)

		//println extension returns the parameter object
		assertSame(initialValue, println(basics.theObject))


		basics.setTheObject("new")
		assertEquals("new",basics.theObject)

		//assignment interpreted as setter call, note missing prefix set
		basics.theObject="new2"
		assertEquals("new2",basics.theObject)


		//access of static fields, methods and inner classes
		assertEquals("CONSTANT",ContainerClass::CONSTANT)	
		assertTrue(ContainerClass::isStaticMethod)
		assertEquals("result", ContainerClass::INSTANCE.result)
		assertEquals("innerResult", new ContainerClass$TheInnerClass1().result)
	}


	def private addOne(BigDecimal number){
		number.add(new BigDecimal("1"));
		//note the big decimal literals
		//number.add(1bd)
	}

	@Test
	def void extensionExample(){
		//classical method call
		assertEquals(1bd, addOne(0bd))

		//methods defined within the same class are automatically available as
		//extension methods
		//the highlighting indicates that addOne is an extension method call
		assertEquals(1bd,0bd.addOne)
	}
}