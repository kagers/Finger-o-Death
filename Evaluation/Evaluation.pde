Button[] buttons;
ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
int row = 0;
int col = 0;
String lastEvaluated = "";
double output = 0.0;
String Ans = "";
String disp = "";
float inLine = 30;
float outLine = 10;
boolean displayOut = false;

void setup() {
  size(400, 500); 
  background(255);
  for (int i=0; i<8; i++) {
    input.add(new ArrayList<String>());
  }
  buttons = new Button[19];
  buttons[0] = new Button(0, height/2, ".");
  buttons[1] = new Button(100, height/2, "(");
  buttons[2] = new Button(200, height/2, ")");
  buttons[3] = new Button(300, height/2, "/");
  buttons[4] = new Button(0, height/2+50, "7");
  buttons[5] = new Button(100, height/2+50, "8");
  buttons[6] = new Button(200, height/2+50, "9");
  buttons[7] = new Button(300, height/2+50, "*");
  buttons[8] = new Button(0, height/2+100, "4");
  buttons[9] = new Button(100, height/2+100, "5");
  buttons[10] = new Button(200, height/2+100, "6");
  buttons[11] = new Button(300, height/2+100, "-");
  buttons[12] = new Button(0, height/2+150, "1");
  buttons[13] = new Button(100, height/2+150, "2");
  buttons[14] = new Button(200, height/2+150, "3");
  buttons[15] = new Button(300, height/2+150, "+");
  buttons[16] = new Button(100, height/2+200, "0");
  buttons[17] = new Button(200, height/2+200, "CLEAR");
  buttons[18] = new Button(300, height/2+200, "ENTER");
}

void draw() {
  System.out.println(input);
  fill(0);
  textAlign(LEFT, BOTTOM);
  background(255);
  for (int i=0; i<input.size (); i++) {
    String joined = combine(input.get(i));
    if (joined.length()>0 && joined.charAt(0)=='~') {
      text(joined.substring(1), 40, 20+30*i);
    } else {
      text(joined, 10, 20+30*i);
    }
  }
  /*if (displayOut) {
   drawOutput();
   }
   drawInput();*/
  //  text("0: "+evaluateParens("4*8-3+2/5*7+3.2"),10,30);
  //  text("1: "+evaluateParens("(2+3)*7"),10,50);
  //  text("2: "+evaluateParens("7*(2+3)"),10,70);
  //  text("3: "+evaluateParens("((4+8)*3)+(5-6)"),10,90);
  for (int i=0; i<buttons.length; i++) {
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

void mouseClicked() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].isClicked()) {
      if (row>=7) {
          input.remove(0);
          input.add(7, new ArrayList<String>());
          row--;
        }
      if (buttons[i].name=="CLEAR") {
        input.get(row).clear();
      } else if (buttons[i].name=="ENTER") {
        //displayOut = true;
        if (input.get(row).size()!=0) {
          lastEvaluated=combine(input.get(row));
          Ans = "~"+evaluateParens(input.get(row));
          input.get(row+1).add(Ans);
          //input.clear();
          //outLine+=40;
          //inLine+=40;
          row++;
        } else {
          Ans = "~"+evaluateParens(lastEvaluated);
          input.get(row).add(Ans);
        }
        row+=1;
        col=0;
      } else {
        input.get(row).add(col, buttons[i].name);
        col++;
      }
    }
    //disp = combine(input);
  }
}
/*void drawInput() {
 text(combine(input), 10, inLine);
 }
 void drawOutput() {
 text(""+output, 30, outLine);
 }*/