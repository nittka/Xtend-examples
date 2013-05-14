package _03_dispatch

import java.math.BigInteger
import org.junit.Test

import static org.junit.Assert.*

class DispatchExample{

	def dispatch doSomething(Object o){"x"}
	def dispatch doSomething(Number b){"y"}
	def dispatch doSomething(BigInteger i){"z"}
	@Test
	def void dispatchExampleOneParameter(){
		assertEquals("x","x".doSomething)
		assertEquals("y",3.doSomething)
		assertEquals("z",3bi.doSomething)
	}


	def dispatch doSomething(Object o, Integer b){"a"}
	def dispatch doSomething(Number o, Object b){"b"}
	def dispatch doSomething(Integer o, Number b){"c"}
	@Test
	def void dispatchExampleTwoParameters(){
		assertEquals("a",doSomething("x",3))
		assertEquals("a","x".doSomething(3))
		assertEquals("b",doSomething(3bi,3))
		assertEquals("c",doSomething(3,3))
	}
}