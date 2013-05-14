package _02_switch

import java.math.BigInteger
import org.junit.Test

import static org.junit.Assert.*

class SwitchExample{

	def String doSwitch(Object o){
		//the first!! match wins
		//note the possible combination of type guard and case expression
		switch (o){
			case null:"null"
			BigInteger case 57bi:"57"
			BigInteger case o.intValue<100: "small big integer"
			BigInteger: "big integer"
			Integer :"integer"
			Number: "number"
			String case o.toUpperCase.contains('V'): "String containing v or V"
			case o.toString.length<2:"short Object"
			default: o?.getClass().simpleName
		}
	}

	@Test
	def void switchExample(){
		assertEquals("null", doSwitch(null))
		assertEquals("number", doSwitch(1.32))
		assertEquals("integer", doSwitch(57))
		assertEquals("57", doSwitch(57bi))
		assertEquals("small big integer", doSwitch(40bi))
		assertEquals("big integer", doSwitch(101bi))
		assertEquals("String containing v or V", doSwitch("foo v"))
		assertEquals("short Object", doSwitch("x"))
		assertEquals("String", doSwitch("foo"))
	}

}