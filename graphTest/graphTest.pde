ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
String lastEvaluated = "";
String Ans = "";

void setup() {
  size(500, 700);
  background(255);
}

void draw() {
  background(255);
  grid();
  graph("X^2");
}

void grid() {
  for (int x=10; x<=width-10; x+=10) {
    stroke(200);
    line(x, 10, x, (height/2)-20);
  } 
  for (int y=10; y< (height/2)- 10; y+=10) {
    stroke(200);
    line(10, y, width-10, y);
  }
  stroke(0);
  line(width/2, 10, width/2, (height/2)-20);
  line(10, 170, width-10, 170);
}

void graph(String function) {
  String funct = "";
  for (float x=-24; x<=24; x+=0.01) {
    String plugged = "";
    for (int i=0; i<function.length (); i++) {
      if (function.charAt(i)=='X') {
        plugged+=""+x;
      } else {
        plugged+=function.charAt(i);
      }
    }
    plotPoint(x*10, (float)evaluateParens(plugged)*10);
  }
}

void plotPoint(float x, float y) {
  fill(255, 0, 0);
  if (170-y>=10 && 170-y<=(height/2)-20) {
    ellipse((width/2)+x, 170-y, 0.05, 0.05);
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
  for (int i=1; i<expression.length ()-1; i++) {
    if ((expression.charAt(i-1)>='0' && expression.charAt(i-1)<='9')&&
      (expression.charAt(i)=='-')&&
      (expression.charAt(i+1)>='0' && expression.charAt(i+1)<='9')) {
      expression=expression.substring(0, i)+"+"+expression.substring(i);
    }
  }
  System.out.println(expression);
  expression=expression.replace("/", "*1/");
  return Double.parseDouble(evaluateHelper(expression, 0));
}
//helper
String evaluateHelper(String expression, int delimiter) {
  //System.out.println(expression);
  String[] pemdas = {
    "+", "*", "/", "\\^"
  };
  String[] oper = expression.split("["+pemdas[delimiter]+"]");
  for (int i=0; i<oper.length; i++) {
    if (delimiter<=2) {
      oper[i]=evaluateHelper(oper[i], delimiter+1);
    }
  }
  int k = 0;
  double out = 0.0;
  if (oper.length>0) {
    while (k<oper.length && oper[k].length ()==0) {
      k++;
    }
    if (k<oper.length) {
      out = Double.parseDouble(oper[k]);
      for (int i=k; i<oper.length-1; i++) {
        if (oper[k].length()>0) {
          switch (delimiter) {
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
            out=Math.pow(out, Double.parseDouble(oper[i+1]));
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
double evaluateParens(ArrayList<String> in) {
  return evaluateParens(combine(in));
} 
String combine(ArrayList<String> in) {
  String joined = "";
  for (int i=0; i<in.size (); i++) {
    joined+=in.get(i);
  }
  return joined;
}
