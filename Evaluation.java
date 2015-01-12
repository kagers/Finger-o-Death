import java.util.*;
import java.lang.*;

public class Evaluation{
    //recursively separates expression into parentheses
    public static double evaluateParens(String expression){
	int startParen = 0;
	int endParen = 0;
	for(int i=0; i<expression.length(); i++){
	    if(expression.charAt(i)=='('){
		startParen++;
	    }else if(expression.charAt(i)==')'){
		endParen++;
	    }
	    if(startParen==endParen && startParen!=0){
		int start = expression.indexOf('(');
		System.out.println("evaluateParens("+expression.substring(0,start)+")+evaluateParens("+expression.substring(start,i)+")'"+expression.substring(i+1)+"')");
		System.out.println("evaluateParens("+expression.substring(0,start)+")+evaluateParens("+expression.substring(start+1,i)+")'"+expression.substring(i+1)+"')");
		return evaluateParens(expression.substring(0,start)+evaluateParens(expression.substring(start+1,i))+expression.substring(i+1));
	    }
	}
	//System.out.println(expression);
	return evaluateMath(expression);
    }
    //recursive expression evaluation
    public static double evaluateMath(String expression){
	if (!evaluateErrors(expression)){
	    for (int i=1; i<expression.length()-1; i++){
		if ((expression.charAt(i-1)>='0' && expression.charAt(i-1)<='9')&&
		    (expression.charAt(i)=='-')&&
		    (expression.charAt(i+1)>='0' && expression.charAt(i+1)<='9')){
		    expression=expression.substring(0,i)+"+"+expression.substring(i);
		}
	    }
	    System.out.println(expression);
	    expression=expression.replace("/","*1/");
	    return Double.parseDouble(evaluateHelper(expression,0));
	} else{
	    return (Integer.MIN_VALUE);
	}
    }
    //helper
    public static String evaluateHelper(String expression, int delimiter){
	System.out.println(expression);
	String[] pemdas = {"+","*","/","\\^"};
	String[] oper = expression.split("["+pemdas[delimiter]+"]");
	for (int i=0; i<oper.length; i++){
	    if (delimiter<=2){
		oper[i]=evaluateHelper(oper[i],delimiter+1);
	    }
	}
	int k = 0;
	double out = 0.0;
	if (oper.length>0){
	    while (k<oper.length && oper[k].length()==0){
		k++;
	    }
	    if (k<oper.length){
		out = Double.parseDouble(oper[k]);
		for (int i=k; i<oper.length-1; i++){
		    if (oper[k].length()>0){
			switch (delimiter){
			case 0: 
			    out+=Double.parseDouble(oper[i+1]);
			    break;
			case 1: 
			    out*=Double.parseDouble(oper[i+1]);
			    break;
			case 2: 
			    out/=Double.parseDouble(oper[i+1]);
			    break;
			case 3: 
			    out=Math.pow(out,Double.parseDouble(oper[i+1]));
			    break;
			}
		    }
		}
	    }
	    return ""+out;
	}
	return "";
    }
    //overloading of parentheses evaluation for String ArrayLists 
    public static double evaluateParens(ArrayList<String> in){
	return evaluateParens(combine(in));
    } 
    //adds all elements of a String ArrayList into one String
    public static String combine(ArrayList<String> in){
	String joined = "";
	for (int i=0; i<in.size(); i++){
	    joined+=in.get(i);
	}
	return joined;
    }
    public static boolean evaluateErrors(String expression){
	if ((expression.charAt(0)=='*'||
	     expression.charAt(0)=='/'||
	     expression.charAt(0)=='^'||
	     expression.charAt(0)=='+')||
	    (expression.charAt(expression.length()-1)=='*'||
	     expression.charAt(expression.length()-1)=='/'||
	     expression.charAt(expression.length()-1)=='+'||
	     expression.charAt(expression.length()-1)=='-'||
	     expression.charAt(expression.length()-1)=='^')){
	    System.out.println("starts or ends w/ aн operaтor");
	    return true;
	}
	int open=0;
	int closed=0;
	for (int i=0; i<expression.length(); i++){
	    if (((i<expression.length()-1) && 
		 (expression.substring(i,i+2).equals("/0"))) ||
		((i<expression.length()-3) &&
		 (expression.substring(i,i+4).equals("/0.0")))){
		System.out.println("divide by zero");
		return true;
	    } else{
		switch(expression.charAt(i)){
		case '(':
		    open++;
		    break;
		case ')':
		    closed++;
		    break;
		}
	    }
	}
	if (open!=closed){
	    System.out.println("parenz");
	    return true;
	}
	return false;
    }	    
    public static void main(String[]args){
	ArrayList<String> a = new ArrayList<String>();
	a.add("4");
	a.add("-");
	a.add("5");
	a.add("*");
	a.add("5");
	a.add("+");
	a.add("7");
	a.add("/");
	a.add("6");
	a.add("*");
	a.add("4");
	//System.out.println("0: "+evaluateParens("4-5*5+7/6.0*4"));
	//System.out.println("0: "+evaluateParens(a));
	//System.out.println("1: "+evaluateParens("(2+3)*(7)"));
	//System.out.println("2: "+evaluateParens("7*(2+3)"));
	//System.out.println("3: "+evaluateParens("(((4+8)*3)+((5-6)*1)*1)^2"));
	//System.out.println("4: "+evaluateParens("((4+8)*3)+(5-6)"));
	//System.out.println("5: "+evaluateParens("(1+2)/(4-4)"));
	//System.out.println("6: "+evaluateParens("(-9/-3)^(3-1"));
	System.out.println("7: "+evaluateParens("-(4^2)3-2"));
    }
}
