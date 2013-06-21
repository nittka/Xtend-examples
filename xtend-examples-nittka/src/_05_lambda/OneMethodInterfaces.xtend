package _05_lambda

import java.util.List

interface OneMethodInterface{
	def boolean checkSomething(String s1, String s2)
}

abstract class Functionality{
	//one abstract method
	def void doSomething(Object o)
	def void basicFunctionality(Object o){}
	def boolean checkSomething(Object o){true}
}

class OneMethodInterfaces {

	def process1(String s, String t, OneMethodInterface checkMethod){
		if(checkMethod.checkSomething(s,t)){
			//do something...
		}
	}

	def showInvokation1(){
		//closure = anonymous class implementingf the interface
		process1("a","b", [s,t|s.length>t.length])
	}


	def process2(List<String> list,Functionality f){
		list.forEach[f.doSomething(it)]
	}

	def showInvokation2(){
		//closure results in anonymous class extending the abstract one
		//where the closure is the implementation of the abstract method
		//"self" allows access to classes methods and fields
		#["a","b","cde"].process2([
			if(self.checkSomething(it)){
				self.basicFunctionality(it)
			}
			println(it)
		])
	}
}