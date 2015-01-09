Button[] buttons;

void setup(){
 size(400,500); 
 background(255);
 buttons = new Button[18];
 buttons[0] = new Button(0,height/2,".");
 buttons[1] = new Button(100,height/2,"(");
 buttons[2] = new Button(200,height/2,")");
 buttons[3] = new Button(300,height/2,"/");
 buttons[4] = new Button(0,height/2+50,"7");
 buttons[5] = new Button(100,height/2+50,"8");
 buttons[6] = new Button(200,height/2+50,"9");
 buttons[7] = new Button(300,height/2+50,"*");
 buttons[8] = new Button(0,height/2+100,"4");
 buttons[9] = new Button(100,height/2+100,"5");
 buttons[10] = new Button(200,height/2+100,"6");
 buttons[11] = new Button(300,height/2+100,"-");
 buttons[12] = new Button(0,height/2+150,"1");
 buttons[13] = new Button(100,height/2+150,"2");
 buttons[14] = new Button(200,height/2+150,"3");
 buttons[15] = new Button(300,height/2+150,"+");
 buttons[16] = new Button(100,height/2+200,"0");
 buttons[17] = new Button(300,height/2+200,"ENTER");
}

void draw(){
  fill(0);
  textAlign(LEFT,BOTTOM);
  text("0: "+evaluateParens("4*8-3+2/5*7+3.2"),10,30);
  text("1: "+evaluateParens("(2+3)*7"),10,50);
  text("2: "+evaluateParens("7*(2+3)"),10,70);
  text("3: "+evaluateParens("((4+8)*3)+(5-6)"),10,90);
  for(int i=0; i<buttons.length; i++){
   buttons[i].draw(); 
  }
}


//separates expression into parentheses
double evaluateParens(String expression) {
  int startParen = 0;
  int endParen = 0;
  for (int i=0; i<expression.length (); i++) {
    if (expression.charAt(i)=='(') {
      startParen++;
    } else if (expression.charAt(i)==')') {
      endParen++;
    }
    if (startParen==endParen && startParen!=0) {
      int start = expression.indexOf('(');
      System.out.println("evaluateParens("+expression.substring(0, start)+")+evaluateParens("+expression.substring(start, i)+")'"+expression.substring(i+1)+"')");
      System.out.println("evaluateParens("+expression.substring(0, start)+")+evaluateParens("+expression.substring(start+1, i)+")'"+expression.substring(i+1)+"')");
      //if(expression.charAt(i)==')'){
      //return evaluateParens(expression.substring(0,start)+evaluateParens(expression.substring(start+1,i)));
      //}else{
      return evaluateParens(expression.substring(0, start)+evaluateParens(expression.substring(start+1, i))+expression.substring(i+1));
      //}
    }
  }
  return evaluateMath(expression);
}
double evaluateMath(String expression) {
  String[] mult, frac;
  ArrayList<String> operators = new ArrayList<String>();
  ArrayList<Double> operands = new ArrayList<Double>();
  expression=expression.replace("-", "+-");
  for (int i=0; i<expression.length (); i++) {
    String here = expression.substring(i, i+1);
    if (here.equals("+")) {
      operators.add(here);
    }
  }
  expression=expression.replace("/", "*1/");
  String[] a = expression.split("[+]");
  for (int i=0; i<a.length; i++) {
    mult=a[i].split("[*]");
    if (!mult[0].equals("")) {
      System.out.println("mult[0]: "+mult[0]);
      double product=Double.parseDouble(mult[0]);
      if (mult.length>1) {
        for (int j=1; j<mult.length; j++) {
          frac=mult[j].split("[/]");
          double res=Double.parseDouble(frac[0]);
          if (frac.length>1) {
            for (int k=1; k<frac.length; k++) {
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
  for (int i=0; i<operands.size ()-1; i++) {
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
double evaluateMath(ArrayList<String> in) {
  return evaluateMath(combine(in));
}
String combine(ArrayList<String> in) {
  String joined = "";
  for (int i=0; i<in.size (); i++) {
    joined+=in.get(i);
  }
  return joined;
}
