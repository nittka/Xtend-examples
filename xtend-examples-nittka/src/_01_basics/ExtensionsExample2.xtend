package _01_basics

import java.math.BigDecimal
//import static extension _01_extensions.StaticExtension.*
//import static extension _01_extensions.ExtensionsExample2.*
import org.junit.Test
import static org.junit.Assert.*

class ExtensionsExample2 {
	
//	extension MemberExtension1 ext1=new MemberExtension1
//	extension MemberExtension2 ext2=new MemberExtension2

	//class internal "extension" method have highest priority
	def BigDecimal addSomething(BigDecimal d){
		d.add(1bd)
	}

//	static methods would have to be imported as static extensions
//	def static BigDecimal addSomething(BigDecimal d){
//		d.add(2bd)
//	}

	@Test
	def void extensionExample(){
		//extension functions are cool
		//they are dangerous as well - if you don't know where
		//they are coming from
		//play around commenting in/out the static extension imports,
		//extension fields and "local" methods"
		assertEquals(1bd, 0bd.addSomething)
	}

	@Test
	def void linkXbaseLib(){
		//make sure you know about the extensins provided in 
		//org.eclipse.xtext.xbase.lib
		//here: operators for big decimals
		assertEquals(0bd,2bd / 2bd - 1bd)
	}
}

class MemberExtension1{
	def BigDecimal addSomething(BigDecimal d){
		d.add(3bd)
	}
}

class MemberExtension2{
	def BigDecimal addSomething(BigDecimal d){
		d.add(4bd)
	}
}

class StaticExtension{
	def static BigDecimal addSomething(BigDecimal d){
		d.add(5bd)
	}
}