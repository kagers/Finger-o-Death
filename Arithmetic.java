import java.util.ArrayList;
public class Arithmetic{
    // groups * and / operations
    public static ArrayList<String> sortMD(String input){
	ArrayList<String> separated = new ArrayList<String>();
	String number = "";
	for(int i=0; i<input.length(); i++){
	    if(input.charAt(i)!='+'&&input.charAt(i)!='-'){
	        number+=input.charAt(i);
	    }else{
		separated.add(number);
		number = "";
		separated.add(""+input.charAt(i));
	    }
	}
	separated.add(number);
	return separated;
    }

    //multiplies and divides groupings
    public static ArrayList<String> MD(ArrayList<String> input){
	for(int i=0;i<input.size();i++){
	    if(input.get(i).indexOf('*')!=-1){
		String[] op = input.get(i).split("[*]");
		input.set(i,""+(Integer.parseInt(op[0])*Integer.parseInt(op[1])));
	    }else if(input.get(i).indexOf('/')!=-1){
		String[] op = input.get(i).split("[/]");
		input.set(i,""+(Integer.parseInt(op[0])/Integer.parseInt(op[1])));
	    }
	}

	return input;
    }


    public static void main(String[]args){
	String in = "4-5*7+12/6";
        ArrayList<String> MDsorted = sortMD(in);
	System.out.println(MDsorted.toString());
	MDsorted = MD(MDsorted);
	System.out.println(MDsorted.toString());
    }
  
}
