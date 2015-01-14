import java.util.*;
import java.lang.*;

public class Evaluation{
    public static String evaluateFunctions(String fxn, String expression){
	System.out.println(fxn+" "+expression+"hi");
	//String fxn = expression.substring(0,expression.indexOf("("));
	String args = expression;
	String after = "";//expression.substring(expression.indexOf(")")+1);
	/*if (args.split("[+\\-/*()]").length>1){
	    return evaluateFunctions(fxn+evaluateParensHelper(args));
	} else {*/
	    double argh = Double.parseDouble(args);
	    boolean mult = true;
	    for (int i=0; i<fxn.length(); i++){
		if (fxn.charAt(i)<'0' || fxn.charAt(i)>'9'){
		    mult=false;
		}
	    }
	    if (mult){
		return ""+Double.parseDouble(fxn)*argh+after;
	    }
	    switch (fxn){
	    case "sqrt":
		return ""+Math.sqrt(argh)+after;
	    case "log":
		return ""+Math.log10(argh)+after;
	    case "ln":
		return ""+Math.log(argh)+after;
	    case "sin":
		return ""+Math.sin(argh)+after;
	    case "cos":
		return ""+Math.cos(argh)+after;
	    case "tan":
		return ""+Math.tan(argh)+after;
	    default:
		return ""+Integer.MIN_VALUE;
	    }
	    //}
    }
    //recursively separates expression into parentheses
    public static double evaluateParens(String expression){
	expression=expression.replace(")(",")*(");
	int startParen = 0;
	int endParen = 0;
	for (int i=0; i<expression.length(); i++){
	    if(expression.charAt(i)=='('){
		startParen++;
	    }else if(expression.charAt(i)==')'){
		endParen++;
	    }
	}
	expression=evaluateParensHelper(expression,false);
	while (expression.charAt(0)=='(' && expression.charAt(expression.length()-1)==')'){
		expression=expression.substring(1,expression.length()-1);
	}
	return Double.parseDouble(expression);
    }
    public static String evaluateParensHelper(String expression, boolean check){
	System.out.println(expression);
	/*if (expression.charAt(0)=='(' && expression.charAt(expression.length()-1)==')'){
	  return expression.substring(1,expression.length()-1);
	  }*/
	int startParen=0;
	int endParen=0;
	/*if (check){
	  System.out.println(expression+"BYE");
	  /*int startParen = 0;
	  int endParen = 0;
	  for (int i=0; i<expression.length(); i++){
	  if(expression.charAt(i)=='('){
	  startParen++;
	  }else if(expression.charAt(i)==')'){
	  endParen++;
	  }
	  }
	  if (expression.length()>0 && expression.indexOf('(')>-1){
	  System.out.println(expression);
	  //if (startParen==1 && endParen==1 && expression.substring(0,expression.indexOf('(')).length()>0){
	  if (expression.substring(0,expression.indexOf('(')).length()>0){
	  return evaluateFunctions(expression.substring(0,expression.indexOf(")")+1))+expression.substring(expression.indexOf(")"));
	  //expression=expression.substring(1,expression.length()-1);
	  } else if (expression.charAt(0)=='(' && expression.charAt(expression.length()-1)==')'){
	  return expression.substring(1,expression.length()-1);
	  }
	  }
	  }*/
	System.out.println("kkk"+expression);
	if (expression.indexOf('(')!=-1){
	    System.out.println("gonna check for fxn");
	    String[] fa = expression.substring(0,expression.indexOf('(')).split("[+\\-/*^]");
	    String f = fa[fa.length-1];
	    String before = expression.substring(0,expression.indexOf(f));
	    /*for (int i=0; i<fa.length-1; i++){
		before+=fa[i];
		}*/
	    boolean mult = false;
	    for (int i=0; i<f.length(); i++){
		if (f.charAt(i)>='0' && f.charAt(i)<='9'){
		    mult=true;
		}
		//System.out.println(mult);
	    }
	    System.out.println("\n"+f);
	    if (f.length()>0 && !mult){
		int index = expression.substring(0,expression.indexOf('(')).length()+1;
		startParen=1;
		while(index<expression.length() && startParen>endParen){
		    if(expression.charAt(index)=='('){
			startParen++;
		    }else if(expression.charAt(index)==')'){
			endParen++;
		    }
		    index++;
		}
		System.out.println(index+" found a fxn "+f);
		if (index+1<expression.length()){
		    System.out.println("stuff after");
		    return evaluateParensHelper(before+evaluateParensHelper(evaluateFunctions(f,evaluateParensHelper(expression.substring(expression.indexOf("("),index),false))+expression.substring(index,index+1)+evaluateParensHelper(expression.substring(index+1),false),false),false);
		}
		else {
		    System.out.println("no stuff after");
		    return evaluateParensHelper(before+evaluateParensHelper(evaluateFunctions(f,evaluateParensHelper(expression.substring(expression.indexOf("(")),false)),false),false);//+expression.substring(index,index+1)+evaluateParensHelper(expression.substring(index+1),false),false);
		}
	    }
	}													       
	System.out.println("no fxns here");
	startParen = 0;
	endParen =  0;
	//System.out.println(expression+"HI");
	for(int i=0; i<expression.length(); i++){
	    if(expression.charAt(i)=='('){
		startParen++;
	    }else if(expression.charAt(i)==')'){
		endParen++;
	    }
	    if(startParen==endParen && startParen!=0){
		int start = expression.indexOf('(');
		//System.out.println("evaluateParens("+expression.substring(0,start)+")+evaluateParens("+expression.substring(start,i)+")'"+expression.substring(i+1)+"')");
		System.out.println("evaluateParensHelper("+expression.substring(0,start)+")+evaluateParensHelper("+expression.substring(start+1,i)+")'"+expression.substring(i+1)+"')");
		System.out.println("breakin it up");
		return evaluateParensHelper(expression.substring(0,start)+evaluateParensHelper(expression.substring(start+1,i),false)+expression.substring(i+1),false);
	    }
	}
	//System.out.println(expression);
	System.out.println("evaluating dis shiz "+expression);
	return evaluateMath(expression)+"";
    }
    //recursive expression evaluation
    public static double evaluateMath(String expression){
	    //if (!evaluateErrors(expression)){
	    for (int i=1; i<expression.length()-1; i++){
		if ((expression.charAt(i-1)>='0' && expression.charAt(i-1)<='9')&&
		    (expression.charAt(i)=='-')&&
		    (expression.charAt(i+1)>='0' && expression.charAt(i+1)<='9')){
		    expression=expression.substring(0,i)+"+"+expression.substring(i);
		}
	    }
	    //System.out.println(expression);
	    expression=expression.replace("/","*1/");
	    //expression=expression.replace("(","");
	    //expression=expression.replace(")","");
	    return Double.parseDouble(evaluateHelper(expression,0));
	    //} else{
	    //return (Integer.MIN_VALUE);
	    //}
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
	System.out.println("\t1: "+evaluateParens("log(2*(2+3))+sqrt(1*7^2)+(-5+-56/-8)"));//+7(9-1)"));
	System.out.println("\t2: "+evaluateParens("(1+3)-(1+4)"));
	System.out.println("\t2: "+evaluateParens("7*(2+3)"));
	System.out.println("\t3: "+evaluateParens("(((4+8)*3)+((5-6)*1)*1)^2"));
	System.out.println("\t4: "+evaluateParens("((4+8)*3)+(5-6)"));
	System.out.println("\t5: "+evaluateParens("(1+2)/(4^0)"));
	System.out.println("\t6: "+evaluateParens("(-9/-3)^(3-1)"));
	System.out.println("\t7: "+evaluateParens("((4^2)*3)-ln(2*(4-3))"));
    }
}
