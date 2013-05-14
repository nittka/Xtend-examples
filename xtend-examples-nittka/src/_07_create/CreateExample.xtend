package _07_create

import org.junit.Test

import static org.junit.Assert.*

class CreateExample{

	@Test
	def void noCreateExample(){
		val original=new Object
		assertNotSame(original.noCreate, original.noCreate)
		assertSame(original.withCreate, original.withCreate)
	}

	def noCreate(Object toTransform){
		new TransformationResult(toTransform)
	}

	def create name:new TransformationResult(o) withCreate(Object o){
		name.someInit(o.toString,o.getClass())
	}

//implicit name "it"
//	def create new TransformationResult(o) withCreate2(Object o){
//		someInit(o.toString,o.getClass())
//	} 
	 
}

class TransformationResult{
	new(Object toTransform){}
	def void someInit(Object ...t){}
}