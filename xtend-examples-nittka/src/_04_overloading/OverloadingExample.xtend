package _04_overloading

import org.junit.Test
import static extension _04_overloading.MyBDExtensions.*
import java.math.BigDecimal
import org.eclipse.xtext.xbase.lib.BigDecimalExtensions
import static org.junit.Assert.*

class OverloadingExample{

	@Test
	def void stupidOverloadingExample(){
		//note that MyBDExtensions is imported as static extension
		assertEquals(0bd,1bd-1bd)
		assertEquals(3bd,1bd+1bd)
		assertEquals("foo",1bd<=>1bd)
		assertEquals("bar",1bd<=>1)

		//note that operators cannot only be overloaded in static extensions
		assertEquals("foo bar",1bd<=>"foo")
	}

	def Object operator_spaceship(BigDecimal i1, String s){
		"foo bar"
	}
}

class MyBDExtensions extends BigDecimalExtensions{
	override static BigDecimal operator_plus(BigDecimal i1, BigDecimal i2){
		new  BigDecimal(3)
	}
	def static Object operator_spaceship(BigDecimal i1, BigDecimal i2){
		"foo"
	}
	def static Object operator_spaceship(BigDecimal i1, int i2){
		"bar"
	}
}