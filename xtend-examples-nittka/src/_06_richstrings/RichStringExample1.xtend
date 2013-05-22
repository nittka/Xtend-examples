package _06_richstrings

import org.junit.Test

class RichStringExample1{

	val exampleObjects=newArrayList("foo",3,true,"bar")
	
	@Test
	def void richString(){
		println(createRichString)
	}

	def createRichString()'''
		First we write much text.
		«IF 3>4»
			This will never happen
		«ELSE»
			3<4
		«ENDIF»
		In between we write even more.
		«FOR i:1..5 BEFORE "Start\n" SEPARATOR "," AFTER "End\n"»
			let's talk about «i»:
				«i» is «i.divisibleBy(2)»
					«i» is «i.divisibleBy(3)»
				«FOR j:exampleObjects.filter(typeof(String))»
					«j»
				«ENDFOR»
		«ENDFOR»
		And there is a footer.
	'''
	
	def divisibleBy(int i1, int i2){
		if (i1%i2==0)
			'''
				«««this is a rich string comment
				divisible by «i2»
			'''
		else
			'''
				not divisible by «i2»
			'''
	}
}