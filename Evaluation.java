import java.util.*;
import java.lang.*;

public class Evaluation{
    //recursively separates expression into parentheses
    public static double evaluateParens(String expression){
	int startParen = 0;
	int endParen = 0;
	for(int i=0; i<expression.length(); i++){
	    //System.out.println("llo");
	    //System.out.println(expression);
	    if(expression.charAt(i)=='('){
		startParen++;
	    }else if(expression.charAt(i)==')'){
		endParen++;
	    }
	    if(startParen==endParen && startParen!=0){
		int start = expression.indexOf('(');
		//System.out.println("evaluateParens("+expression.substring(0,start)+")+evaluateParens("+expression.substring(start,i)+")'"+expression.substring(i+1)+"')");
		//System.out.println("evaluateParens("+expression.substring(0,start)+")+evaluateParens("+expression.substring(start+1,i)+")'"+expression.substring(i+1)+"')");
		return evaluateParens(expression.substring(0,start)+evaluateParens(expression.substring(start+1,i))+expression.substring(i+1));
	    }
	}
	//System.out.println(expression);
	return evaluateMath(expression);
    }
    /*//outdated expression evaluator
    public static double eval(String expression){
	String[] mult,frac;
	ArrayList<String> operators = new ArrayList<String>();
	ArrayList<Double> operands = new ArrayList<Double>();
	expression=expression.replace("-","+-");
	expression=expression.replace("/","*1/");
	String[] a = expression.split("[+]");
	for (int i=0; i<a.length; i++){
	    mult=a[i].split("[*]");
	    System.out.println(Arrays.toString(a));
	    System.out.println(Arrays.toString(mult));
	    if(!mult[0].equals("")){
		System.out.println("mult[0]: "+mult[0]);
		double product=Double.parseDouble(mult[0]);
		if (mult.length>1){
		    for (int j=1; j<mult.length; j++){
			frac=mult[j].split("[/]");
			double res=Double.parseDouble(frac[0]);
			if (frac.length>1){
			    for (int k=1; k<frac.length; k++){
				res/=Double.parseDouble(frac[k]);
			    }
			}
			mult[j]=""+res;
			product*=Double.parseDouble(mult[j]);
		    }
		}
		operands.add(product);
	    }
	}
	double out=operands.get(0);
	System.out.println(operators);
	for (int i=0;i<operands.size()-1;i++){
	    /*System.out.println(out);
	    System.out.println(operands);
	    System.out.println(operators.get(i));
	    //if (operators.get(i).equals("+")){
		out+=operands.get(i+1);
		//else{
		//out-=operands.get(i+1);
		//}
	    System.out.println(out);
	}
	return out;
	}*/
    //recursive expression evaluation
    public static double evaluateMath(String expression){
	//expression=expression.replace("-","+-");
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
    }
    //helper
    public static String evaluateHelper(String expression, int delimiter){
	//System.out.println(expression);
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
    /*public static boolean evaluateErrors(String expression){
	if ((evaluateErrors.charAt(0)=='*'||
	     evaluateErrors.charAt(0)=='/'||
	     evaluateErrors.charAt(0)=='^'||
	     evaluateErrors.charAt(0)=='+'||)||
	    (evaluateErrors.charAt(evaluateErrors.length()-1)=='*'||
	     evaluateErrors.charAt(evaluateErrors.length()-1)=='/'||
	     evaluateErrors.charAt(evaluateErrors.length()-1)=='+'||
	     evaluateErrors.charAt(evaluateErrors.length()-1)=='-'||
	     evaluateErrors.charAt(evaluateErrors.length()-1)=='^')){
	    System.out.println("starts or ends w/ aн operaтor");
	    return true;
	}
	int open=0;
	int closed=0;
	for (int i=0; i<expression.length(); i++){
	    if (!(expression.substring(i,i).equals("/0")) || (i)){
		switch(expression.charAt(i)){
		case '(':
		    open++;
		    break;
		case ')':
		    closed++;
		    break;
		}
	    } else{
		System.out.println("divide by zero");
		return true;
	    }
	}
	if (open!=closed){
	    System.out.println("parenz");
	    return true;
	}
	return false;
    }*/	    
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
	System.out.println("0: "+evaluateErrors("4-5*5+7/6.0*4"));
	System.out.println("0: "+evaluateParens(a));
	System.out.println("1: "+evaluateErrors("(2+3)*(7)"));
	System.out.println("2: "+evaluateErrors("7*(2+3)"));
	System.out.println("3: "+evaluateErrors("(((4+8)*3)+((5-6)*1)*1)^2"));
	System.out.println("4: "+evaluateErrors("((4+8)*3)+(5-6)"));
	System.out.println("5: "+evaluateErrors("(1+2)*(3-4)"));
	System.out.println("6: "+evaluateErrors("(-9/-3)^(3-1"));
	System.out.println("7: "+evaluateErrors("(-9/-3)^(1-1)"));
    }
}
