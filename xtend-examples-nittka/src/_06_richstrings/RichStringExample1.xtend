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
		ÇIF 3>4È
			This will never happen
		ÇELSEÈ
			3<4
		ÇENDIFÈ
		In between we write even more.
		ÇFOR i:1..5 BEFORE "Start\n" SEPARATOR "," AFTER "End\n"È
			let's talk about ÇiÈ:
				ÇiÈ is Çi.divisibleBy(2)È
					ÇiÈ is Çi.divisibleBy(3)È
				ÇFOR j:exampleObjects.filter(typeof(String))È
					ÇjÈ
				ÇENDFORÈ
		ÇENDFORÈ
		And there is a footer.
	'''
	
	def divisibleBy(int i1, int i2){
		if (i1%i2==0)
			'''
				ÇÇÇthis is a rich string comment
				divisible by Çi2È
			'''
		else
			'''
				not divisible by Çi2È
			'''
	}
}