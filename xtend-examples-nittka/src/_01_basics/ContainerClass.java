package _01_basics;

/**
 * dummy class for illustrating static access in Xtend
 * */
class ContainerClass {

	static final ContainerClass INSTANCE=new ContainerClass();
	static final String CONSTANT="CONSTANT";
	static boolean isStaticMethod(){
		return true;
	}

	String getResult(){
		return "result";
	}

	static class TheInnerClass1{
		public String getResult(){
			return "innerResult";
		}
	} 
}
