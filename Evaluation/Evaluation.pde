Button[] buttons;
boolean on = false;
ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
int row = 0;
int col = 0;
String lastEvaluated = "";
String Ans = "";
String disp = "";
boolean displayOut = false;
int cursorX = 11;
int cursorY = 7;
String[] functions;
String mode = "NORM";
String screen = "NORM";

void setup() {
  size(500, 700); 
  background(255);
  fill(0);
  rect(cursorX, 20, 5, 10);
  for (int i=0; i<8; i++) {
    input.add(new ArrayList<String>());
  }
  buttons = new Button[51];
  buttons[0] = new Button(0, height/2-height/2/10, width/5, height/20, "Y=", "STAT PLOT", "F1", 170);
  buttons[1] = new Button(1*width/5, height/2-height/2/10, width/5, height/20, "WINDOW", "TBLSET", "F2", 170);
  buttons[2] = new Button(2*width/5, height/2-height/2/10, width/5, height/20, "ZOOM", "FORMAT", "F3", 170);
  buttons[3] = new Button(3*width/5, height/2-height/2/10, width/5, height/20, "TRACE", "CALC", "F4", 170);
  buttons[4] = new Button(4*width/5, height/2-height/2/10, width/5, height/20, "GRAPH", "TABLE", "F5", 170);

  buttons[5] = new Button(0, height/2+(0*height/2/10), "2nd", "", "");
  buttons[6] = new Button(1*width/5, height/2+(0*height/2/10), "MODE", "QUIT", "");
  buttons[7] = new Button(2*width/5, height/2+(0*height/2/10), "DEL", "INS", "");
  buttons[8] = new Button(15*width/20, height/2+(0*height/2/10)+3, width/10, height/20-height/40+1, "N", "", "", 170);

  buttons[9] = new Button(0, height/2+(1*height/2/10), "ALPHA", "A-LOCK", "");
  buttons[10] = new Button(1*width/5, height/2+(1*height/2/10), "X", "LINK", "");
  buttons[11] = new Button(2*width/5, height/2+(1*height/2/10), "STAT", "LIST", "");
  buttons[12] = new Button(13*width/20, height/2+(0.5*height/2/10)+5, width/10, height/20-height/40+1, "W", "", "", 170);
  buttons[13] = new Button(15*width/20, height/2+(1*height/2/10)+6, width/10, height/20-height/40+1, "S", "", "", 170);
  buttons[14] = new Button(17*width/20, height/2+(0.5*height/2/10)+5, width/10, height/20-height/40+1, "E", "", "", 170);

  buttons[15] = new Button(0, height/2+(2*height/2/10), "MATH", "TEST", "A");
  buttons[16] = new Button(1*width/5, height/2+(2*height/2/10), "APPS", "ANGLE", "B");
  buttons[17] = new Button(2*width/5, height/2+(2*height/2/10), "PRGM", "DRAW", "C");
  buttons[18] = new Button(3*width/5, height/2+(2*height/2/10), "VARS", "DISTR", "");
  buttons[19] = new Button(4*width/5, height/2+(2*height/2/10), "CLEAR", "", "");

  buttons[20] = new Button(0, height/2+(3*height/2/10), "x^-1", "MATRIX", "D");
  buttons[21] = new Button(1*width/5, height/2+(3*height/2/10), "SIN", "SIN^-1", "E");
  buttons[22] = new Button(2*width/5, height/2+(3*height/2/10), "COS", "COS^-1", "F");
  buttons[23] = new Button(3*width/5, height/2+(3*height/2/10), "TAN", "TAN^-1", "G");
  buttons[24] = new Button(4*width/5, height/2+(3*height/2/10), width/5, height/20, "^", "PI", "H", 170);

  buttons[25] = new Button(0, height/2+(4*height/2/10), "x^2", "SQRT", "I");
  buttons[26] = new Button(1*width/5, height/2+(4*height/2/10), width/5, height/20+height/20/5, ",", "EE", "J", 225);
  buttons[27] = new Button(2*width/5, height/2+(4*height/2/10), width/5, height/20+height/20/5, "(", "{", "K", 225);
  buttons[28] = new Button(3*width/5, height/2+(4*height/2/10), width/5, height/20+height/20/5, ")", "}", "L", 225);
  buttons[29] = new Button(4*width/5, height/2+(4*height/2/10), width/5, height/20, "/", "e", "M", 170);

  buttons[30] = new Button(0, height/2+(5*height/2/10), "LOG", "10^x", "N");
  buttons[31] = new Button(1*width/5, height/2+(5*height/2/10)+height/20/5, width/5, height/20+height/20/5, "7", "u", "O", 225);
  buttons[32] = new Button(2*width/5, height/2+(5*height/2/10)+height/20/5, width/5, height/20+height/20/5, "8", "v", "P", 225);
  buttons[33] = new Button(3*width/5, height/2+(5*height/2/10)+height/20/5, width/5, height/20+height/20/5, "9", "w", "Q", 225);
  buttons[34] = new Button(4*width/5, height/2+(5*height/2/10), width/5, height/20, "*", "[", "R", 170);

  buttons[35] = new Button(0, height/2+(6*height/2/10), "LN", "e^x", "S");
  buttons[36] = new Button(1*width/5, height/2+(6*height/2/10)+2*height/20/5, width/5, height/20+height/20/5, "4", "L4", "T", 225);
  buttons[37] = new Button(2*width/5, height/2+(6*height/2/10)+2*height/20/5, width/5, height/20+height/20/5, "5", "L5", "U", 225);
  buttons[38] = new Button(3*width/5, height/2+(6*height/2/10)+2*height/20/5, width/5, height/20+height/20/5, "6", "L6", "V", 225);
  buttons[39] = new Button(4*width/5, height/2+(6*height/2/10), width/5, height/20, "-", "]", "W", 170);

  buttons[40] = new Button(0, height/2+(7*height/2/10), "STO->", "RCL", "X");
  buttons[41] = new Button(1*width/5, height/2+(7*height/2/10)+3*height/20/5, width/5, height/20+height/20/5, "1", "L1", "Y", 225);
  buttons[42] = new Button(2*width/5, height/2+(7*height/2/10)+3*height/20/5, width/5, height/20+height/20/5, "2", "L2", "Z", 225);
  buttons[43] = new Button(3*width/5, height/2+(7*height/2/10)+3*height/20/5, width/5, height/20+height/20/5, "3", "L3", "THETA", 225);
  buttons[44] = new Button(4*width/5, height/2+(7*height/2/10), width/5, height/20, "+", "MEM", "''", 170);

  buttons[45] = new Button(0, height/2+(8*height/2/10), "ON", "OFF", "");
  buttons[46] = new Button(1*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, "0", "CATALOG", "SPACE", 225);
  buttons[47] = new Button(2*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, ".", "i", ":", 225);
  buttons[48] = new Button(3*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, "(-)", "ANS", "?", 225);
  buttons[49] = new Button(4*width/5, height/2+(8*height/2/10), width/5, height/20+5*height/20/5, "ENTER", "ENTRY", "SOLVE", 170);
  buttons[50] = new Button(4*width/5, height/2+(2*height/2/10), "CLEAR", "", "");
}

void draw() {
  System.out.println(input);
  fill(0);
  textAlign(LEFT, BOTTOM);
  background(255);
  if (screen.equals("NORM")) {
    drawCursor();
    for (int i=0; i<input.size (); i++) {
      String joined = combine(input.get(i));
      if (joined.length()>0 && joined.charAt(0)=='~') {
        text(joined.substring(1), 85, 20+30*i);
      } else {
        text(joined, 10, 20+30*i);
      }
    }
  } else if (screen.equals("Y=")) {
    for (int i=0; i<10; i++) {
      text("Y"+i+"=", 40, 20+(30*i));
      cursorX=70;
      drawCursor();
    }
  } else if (screen.equals("GRAPH")) {
    grid();
    graph("(1/3)*X^2");
  }
  for (int i=0; i<buttons.length; i++) {
    buttons[i].draw();
  }
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

void mouseClicked() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].isClicked()) {
      if (row>=7) {
        input.remove(0);
        input.add(7, new ArrayList<String>());
        row--;
      }   
      if (mode.equals("NORM")) {
        if (buttons[i].name=="2nd") {
          mode = "2nd";
        } else if (buttons[i].name=="ALPHA") {
          mode = "ALPHA";
        } else if (buttons[i].name=="CLEAR") {
          if (screen.equals("GRAPH")) {
            screen="NORM";
          } else {
            if (combine(input.get(row)).length()>0) {
              input.get(row).clear();
              col=0;
            } else {
              for (int j=0; j<input.size (); j++) {
                input.get(j).clear();
                row=0;
              }
            }
          }
        } else if (buttons[i].name=="ENTER") {
          //displayOut = true;
          if (input.get(row).size()!=0) {
            lastEvaluated=combine(input.get(row));
            Ans = "~"+evaluateParens(input.get(row));
            input.get(row+1).add(Ans);
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
        } else if (buttons[i].name=="Y=") {
          screen="Y=";
        } else if (buttons[i].name=="GRAPH") {
          screen="GRAPH";
        } else {
          if (buttons[i].name=="LOG" || buttons[i].name=="LN" ||
          buttons[i].name=="SIN" || buttons[i].name=="COS" || buttons[i].name=="TAN") {
            input.get(row).add(col, buttons[i].name.toLowerCase()+"(");
          } else {
            input.get(row).add(col, buttons[i].name);
          }
          cursorX+=textWidth(buttons[i].name);
          col++;
        }
      } else if (mode.equals("2nd")) {
        if (buttons[i].name=="2nd") {
          mode = "NORM";
        } else if (buttons[i].name=="ALPHA") {
          mode = "ALPHA";
        } else if (buttons[i].name=="CLEAR") {
          if (combine(input.get(row)).length()>0) {
            input.get(row).clear();
            col=0;
          } else {
            for (int j=0; j<input.size (); j++) {
              input.get(j).clear();
              row=0;
            }
          }
        } else {
          input.get(row).add(col, buttons[i].sec);
          cursorX+=textWidth(buttons[i].sec);
          col++;
        }
        mode = "NORM";
      } else if (mode.equals("ALPHA")) {
        if (buttons[i].name=="2nd") {
          mode = "2nd";
        } else if (buttons[i].name=="ALPHA") {
          mode = "NORM";
        } else if (buttons[i].name=="CLEAR") {
          if (combine(input.get(row)).length()>0) {
            input.get(row).clear();
            col=0;
          } else {
            for (int j=0; j<input.size (); j++) {
              input.get(j).clear();
              row=0;
            }
          }
        } else {
          input.get(row).add(col, buttons[i].alph);
          cursorX+=textWidth(buttons[i].alph);
          col++;
        }
        mode = "NORM";
      }
    }
    //disp = combine(input);
  }
}
String evaluateFunctions(String fxn, String expression) {
  String args = expression;
  double argh = Double.parseDouble(args);
  boolean mult = true;
  for (int i=0; i<fxn.length (); i++) {
    if (fxn.charAt(i)<'0' || fxn.charAt(i)>'9') {
      mult=false;
    }
  }
  if (mult) {
    return ""+Double.parseDouble(fxn)*argh;
  }
  if (fxn.equals("sqrt")) {
    return ""+Math.sqrt(argh);
  } else if (fxn.equals("log")) {
    return ""+Math.log10(argh);
  } else if (fxn.equals("ln")) {
    return ""+Math.log(argh);
  } else if (fxn.equals("sin")) {
    return ""+Math.sin(argh);
  } else if (fxn.equals("cos")) {
    return ""+Math.cos(argh);
  } else if (fxn.equals("tan")) {
    return ""+Math.tan(argh);
  } else if (fxn.equals("asin")) {
    return ""+Math.asin(argh);
  } else if (fxn.equals("acos")) {
    return ""+Math.acos(argh);
  } else if (fxn.equals("atan")) {
    return ""+Math.atan(argh);
  } else {
    return ""+Integer.MAX_VALUE;
  }
}
//recursively separates expression into parentheses
double evaluateParens(String expression) {
  expression=expression.replace(")(", ")*(");
  int startParen = 0;
  int endParen = 0;
  for (int i=0; i<expression.length (); i++) {
    if (expression.charAt(i)=='(') {
      startParen++;
    } else if (expression.charAt(i)==')') {
      endParen++;
    }
  }
  expression=evaluateParensHelper(expression);
  while (expression.charAt (0)=='(' && expression.charAt(expression.length()-1)==')') {
    expression=expression.substring(1, expression.length()-1);
  }
  return Double.parseDouble(expression);
}
String evaluateParensHelper(String expression) {
  int startParen=0;
  int endParen=0;
  if (expression.indexOf('(')!=-1) {
    String[] fa = expression.substring(0, expression.indexOf('(')).split("[+\\-/*^]");
    String f = fa[fa.length-1];
    String before = expression.substring(0, expression.indexOf(f));
    boolean mult = false;
    for (int i=0; i<f.length (); i++) {
      if (f.charAt(i)>='0' && f.charAt(i)<='9') {
        mult=true;
      }
    }
    if (f.length()>0 && !mult) {
      int index = expression.substring(0, expression.indexOf('(')).length()+1;
      startParen=1;
      while (index<expression.length () && startParen>endParen) {
        if (expression.charAt(index)=='(') {
          startParen++;
        } else if (expression.charAt(index)==')') {
          endParen++;
        }
        index++;
      }
      if (index+1<expression.length()) {
        expression = before+evaluateFunctions(f, ""+evaluateParens(expression.substring(expression.indexOf("("), index)))+expression.substring(index);//+evaluateParensHelper(expression.substring(index+1));
        return evaluateParensHelper(expression);
      } else {
        expression = before+(evaluateFunctions(f, ""+evaluateParens(expression.substring(expression.indexOf("(")))));//+expression.substring(index,index+1)+evaluateParensHelper(expression.substring(index+1),false),false);
      }
    }
  }                                 
  startParen = 0;
  endParen =  0;
  for (int i=0; i<expression.length (); i++) {
    if (expression.charAt(i)=='(') {
      startParen++;
    } else if (expression.charAt(i)==')') {
      endParen++;
    }
    if (startParen==endParen && startParen!=0) {
      int start = expression.indexOf('(');
      return evaluateParensHelper(expression.substring(0, start)+evaluateParensHelper(expression.substring(start+1, i))+expression.substring(i+1));
    }
  }
  return evaluateMath(expression)+"";
}
//recursive expression evaluation
double evaluateMath(String expression) {
  for (int i=1; i<expression.length ()-1; i++) {
    if ((expression.charAt(i-1)>='0' && expression.charAt(i-1)<='9')&&
      (expression.charAt(i)=='-')&&
      (expression.charAt(i+1)>='0' && expression.charAt(i+1)<='9')) {
      expression=expression.substring(0, i)+"+"+expression.substring(i);
    }
  }
  expression=expression.replace("/", "*1/");
  return Double.parseDouble(evaluateHelper(expression, 0));
}
//helper
String evaluateHelper(String expression, int delimiter) {
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
//adds all elements of a String ArrayList into one String
String combine(ArrayList<String> in) {
  String joined = "";
  for (int i=0; i<in.size (); i++) {
    joined+=in.get(i);
  }
  return joined;
}

