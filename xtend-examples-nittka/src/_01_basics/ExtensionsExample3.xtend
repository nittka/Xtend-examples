package _01_basics

interface Functionality{
	def String scramble(String s);
}

class ExtensionsExample3 {

	//parameters can be marked as extensions
	def doSomthing(String s, extension Functionality f){
		s.toUpperCase.scramble
	}
}