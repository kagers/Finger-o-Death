import java.util.*;
import java.lang.Math;
public class Evaluation{

    //separates expression into parentheses
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
		//if(expression.charAt(i)==')'){
		//return evaluateParens(expression.substring(0,start)+evaluateParens(expression.substring(start+1,i)));
		//}else{
		return evaluateParens(expression.substring(0,start)+evaluateParens(expression.substring(start+1,i))+expression.substring(i+1));
		    //}
	    }
	}
	return evaluateMath(expression);
    }

    public static double evaluateMath(String expression){
	String[] mult,frac;
	ArrayList<String> operators = new ArrayList<String>();
	ArrayList<Double> operands = new ArrayList<Double>();
	expression=expression.replace("-","+-");
	for (int i=0;i<expression.length();i++){
	    String here = expression.substring(i,i+1);
	    if (here.equals("+")){
		operators.add(here);
	    }	    
	}
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
	    System.out.println(out);
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
    }
    public static double evaluateMath(ArrayList<String> in){
	return evaluateMath(combine(in));
    } 
    public static String combine(ArrayList<String> in){
	String joined = "";
	for (int i=0; i<in.size(); i++){
	    joined+=in.get(i);
	}
	return joined;
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
	System.out.println("0: "+evaluateMath("4-5*5+7/6.0*4"));
	System.out.println("0: "+evaluateMath(a));
	System.out.println("1: "+evaluateParens("(2+3)*(7)"));
	System.out.println("2: "+evaluateParens("7*(2+3)"));
	System.out.println("3: "+evaluateParens("((4+8)*3)+((5-6)*1)*1"));
	System.out.println("4: "+evaluateParens("((4+8)*3)+(5-6)"));
    }
}
