import java.util.*;

public class Parse{
    //separate expression into its parentheses delimited subsets
    /*public static String[] parentheses(String in){

	}*/
    //evaluates an expression
    public static double evaluate(String expression){
	String[] mult,frac;
	ArrayList<String> operators = new ArrayList<String>();
	ArrayList<Double> operands = new ArrayList<Double>();
	for (int i=0;i<expression.length();i++){
	    String here = expression.substring(i,i+1);
	    if (here.equals("+") || here.equals("-")){
		operators.add(here);
	    }	    
	}
	//System.out.println(expression);
	//expression=expression.replace("-","+-");
	expression=expression.replace("/","*1/");
	//System.out.println(expression);
	String[] a = expression.split("[+\\-]");
	//System.out.println(Arrays.toString(a));
	for (int i=0; i<a.length; i++){
	    mult=a[i].split("[*]");
	    double product=Double.parseDouble(mult[0]);
	    if (mult.length>1){
		System.out.println(Arrays.toString(mult));
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
	    //System.out.println(Arrays.toString(a));
	}
	//System.out.println(Arrays.toString(a));
	System.out.println(operands);
	System.out.println(operators);
	double out=operands.get(0);
	for (int i=0;i<operators.size();i++){
	    if (operators.get(i).equals("+")){
		out+=operands.get(i+1);
	    }else{
		out-=operands.get(i+1);
	    }
	    //System.out.println(out);
	}
	return out;   
    }
    public static void main(String[]args){
	//String x="((1+1)-(4*(6/7)))";
	//String[] y=x.split("5");
	//String y="(* 3 3 3 6)";
	//System.out.println(Arrays.toString(y));
	System.out.println(evaluate("4-5*5+7/6.0*4"));
    }
}
