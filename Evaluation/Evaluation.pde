Button[] buttons;
boolean on = false;
ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
int row = 0;
int col = 0;
String lastEvaluated = "";
//double output = 0.0;
String Ans = "";
String disp = "";
//float inLine = 30;
//float outLine = 10;
boolean displayOut = false;
int cursorX = 11;
int cursorY = 7;

void setup() {
  size(400, 500); 
  background(255);
  fill(0);
  rect(cursorX, 20, 5, 10);
  for (int i=0; i<8; i++) {
    input.add(new ArrayList<String>());
  }
  buttons = new Button[51];
  buttons[0] = new Button(0, height/2-height/2/10,width/5,height/20, "Y=",170);
  buttons[1] = new Button(1*width/5, height/2-height/2/10,width/5,height/20, "WINDOW",170);
  buttons[2] = new Button(2*width/5, height/2-height/2/10,width/5,height/20, "ZOOM",170);
  buttons[3] = new Button(3*width/5, height/2-height/2/10,width/5,height/20, "TRACE",170);
  buttons[4] = new Button(4*width/5, height/2-height/2/10,width/5,height/20, "GRAPH",170);

  buttons[5] = new Button(0,  height/2+(0*height/2/10), "2nd");
  buttons[6] = new Button(1*width/5, height/2+(0*height/2/10), "MODE");
  buttons[7] = new Button(2*width/5, height/2+(0*height/2/10), "DEL");
  buttons[8] = new Button(15*width/20, height/2+(0*height/2/10)+3,width/10,height/20-height/40+1, "N",170);

  buttons[9] = new Button(0, height/2+(1*height/2/10), "ALPHA");
  buttons[10] = new Button(1*width/5, height/2+(1*height/2/10), "X");
  buttons[11] = new Button(2*width/5, height/2+(1*height/2/10), "STAT");
  buttons[12] = new Button(13*width/20, height/2+(0.5*height/2/10)+5,width/10,height/20-height/40+1, "W",170);
  buttons[13] = new Button(15*width/20, height/2+(1*height/2/10)+6,width/10,height/20-height/40+1, "S",170);
  buttons[14] = new Button(17*width/20, height/2+(0.5*height/2/10)+5,width/10,height/20-height/40+1, "E",170);

  buttons[15] = new Button(0, height/2+(2*height/2/10), "MATH");
  buttons[16] = new Button(1*width/5, height/2+(2*height/2/10), "APPS");
  buttons[17] = new Button(2*width/5, height/2+(2*height/2/10), "PRGM");
  buttons[18] = new Button(3*width/5, height/2+(2*height/2/10), "VARS");
  buttons[19] = new Button(4*width/5, height/2+(2*height/2/10), "CLEAR");

  buttons[20] = new Button(0, height/2+(3*height/2/10), "x^-1");
  buttons[21] = new Button(1*width/5, height/2+(3*height/2/10), "SIN");
  buttons[22] = new Button(2*width/5, height/2+(3*height/2/10), "COS");
  buttons[23] = new Button(3*width/5, height/2+(3*height/2/10), "TAN");
  buttons[24] = new Button(4*width/5, height/2+(3*height/2/10),width/5,height/20, "^",170);

  buttons[25] = new Button(0, height/2+(4*height/2/10), "x^2");
  buttons[26] = new Button(1*width/5, height/2+(4*height/2/10),width/5,height/20+height/20/5, ",",225);
  buttons[27] = new Button(2*width/5, height/2+(4*height/2/10),width/5,height/20+height/20/5, "(",225);
  buttons[28] = new Button(3*width/5, height/2+(4*height/2/10),width/5,height/20+height/20/5, ")",225);
  buttons[29] = new Button(4*width/5, height/2+(4*height/2/10),width/5,height/20, "/",170);

  buttons[30] = new Button(0, height/2+(5*height/2/10), "LOG");
  buttons[31] = new Button(1*width/5, height/2+(5*height/2/10)+height/20/5,width/5,height/20+height/20/5, "7",225);
  buttons[32] = new Button(2*width/5, height/2+(5*height/2/10)+height/20/5,width/5,height/20+height/20/5, "8",225);
  buttons[33] = new Button(3*width/5, height/2+(5*height/2/10)+height/20/5,width/5,height/20+height/20/5, "9",225);
  buttons[34] = new Button(4*width/5, height/2+(5*height/2/10),width/5,height/20, "*",170);

  buttons[35] = new Button(0, height/2+(6*height/2/10), "LN");
  buttons[36] = new Button(1*width/5, height/2+(6*height/2/10)+2*height/20/5,width/5,height/20+height/20/5, "4",225);
  buttons[37] = new Button(2*width/5, height/2+(6*height/2/10)+2*height/20/5,width/5,height/20+height/20/5, "5",225);
  buttons[38] = new Button(3*width/5, height/2+(6*height/2/10)+2*height/20/5,width/5,height/20+height/20/5, "6",225);
  buttons[39] = new Button(4*width/5, height/2+(6*height/2/10),width/5,height/20, "-",170);

  buttons[40] = new Button(0, height/2+(7*height/2/10), "STO->");
  buttons[41] = new Button(1*width/5, height/2+(7*height/2/10)+3*height/20/5,width/5,height/20+height/20/5, "1",225);
  buttons[42] = new Button(2*width/5, height/2+(7*height/2/10)+3*height/20/5,width/5,height/20+height/20/5, "2",225);
  buttons[43] = new Button(3*width/5, height/2+(7*height/2/10)+3*height/20/5,width/5,height/20+height/20/5, "3",225);
  buttons[44] = new Button(4*width/5, height/2+(7*height/2/10),width/5,height/20, "+",170);

  buttons[45] = new Button(0, height/2+(8*height/2/10), "ON");
  buttons[46] = new Button(1*width/5, height/2+(8*height/2/10)+4*height/20/5,width/5,height/20+height/20/5, "0",225);
  buttons[47] = new Button(2*width/5, height/2+(8*height/2/10)+4*height/20/5,width/5,height/20+height/20/5, ".",225);
  buttons[48] = new Button(3*width/5, height/2+(8*height/2/10)+4*height/20/5,width/5,height/20+height/20/5, "(-)",225);
  buttons[49] = new Button(4*width/5, height/2+(8*height/2/10),width/5,height/20+5*height/20/5, "ENTER",170);
  buttons[50] = new Button(4*width/5,height/2+(2*height/2/10), "CLEAR");
}

void draw() {
  System.out.println(input);
  fill(0);
  textAlign(LEFT, BOTTOM);
  background(255);
  drawCursor();
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

void drawCursor() {
  if ((frameCount/30)%2==0) {
    stroke(0);
    fill(0);
  } else {
    stroke(255);
    fill(255);
  }
  rect(cursorX, cursorY, 5, 10);
  stroke(0);
  fill(0);
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
        if (combine(input.get(row)).length()>0) {
          input.get(row).clear();
          col=0;
        } else {
          for (int j=0; j<input.size (); j++) {
            input.get(j).clear();
            row=0;
          }
        }
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
          cursorY+=60;
        } else {
          Ans = "~"+evaluateParens(lastEvaluated);
          input.get(row).add(Ans);
          cursorY+=30;
        }
        cursorX=11;
        row+=1;
        col=0;
      } else {
        input.get(row).add(col, buttons[i].name);
        cursorX+=textWidth(buttons[i].name);
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
