Button[] buttons;
Graphs g;
boolean on = false;
ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<String>> graphInput = new ArrayList<ArrayList<String>>();
int row = 0;
int col = 0;
String lastEvaluated = "";
String Ans = "~0";
String disp = "";
boolean displayOut = false;
int cursorX = 11;
int cursorY = 7;
int startRow = 0;
int endRow = 1;
String[] functions;
String mode = "NORM";
String screen = "NORM";
//double Ans = 0;
String[] alphabet = new String[26];

void setup() {
  size(500, 700); 
  background(255);
  fill(0);
  rect(cursorX, 20, 5, 10);
  for (int i=0; i<8; i++) {
    input.add(new ArrayList<String>());
  }
  for (int j=0; j<10; j++) {
    graphInput.add(new ArrayList<String>());
  }
  for (int i=0; i<alphabet.length; i++) {
    alphabet[i] = "0.0";
  }

  g = new Graphs();

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
  buttons[21] = new Button(1*width/5, height/2+(3*height/2/10), "SIN", "aSIN", "E");
  buttons[22] = new Button(2*width/5, height/2+(3*height/2/10), "COS", "aCOS", "F");
  buttons[23] = new Button(3*width/5, height/2+(3*height/2/10), "TAN", "aTAN", "G");
  buttons[24] = new Button(4*width/5, height/2+(3*height/2/10), width/5, height/20, "^", "π", "H", 170);

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

  buttons[45] = new Button(0, height/2+(8*height/2/10), width/5, height/20+5*height/20/5, "ON", "OFF", "", 125);
  buttons[46] = new Button(1*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, "0", "CATALOG", "SPACE", 225);
  buttons[47] = new Button(2*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, ".", "i", ":", 225);
  buttons[48] = new Button(3*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, "(-)", "ANS", "?", 225);
  buttons[49] = new Button(4*width/5, height/2+(8*height/2/10), width/5, height/20+5*height/20/5, "ENTER", "ENTRY", "SOLVE", 170);
  buttons[50] = new Button(4*width/5, height/2+(2*height/2/10), "CLEAR", "", "");
}

void draw() {
  //System.out.println(input);
  //System.out.println(endRow);
  //System.out.println(startRow);
  //System.out.println(row);
  /*for (int i=0; i<alphabet.length; i++){
   System.out.println(alphabet[i]); 
   }*/
  fill(0);
  textAlign(LEFT, BOTTOM);
  background(255);
  if (screen.equals("NORM")) {//normal display screen
    drawCursor();
    for (int i=startRow; i<=endRow; i++) {
      String joined = combine(input.get(i));
      if (joined.length()>0 && joined.charAt(0)=='~') {
        text(joined.substring(1), 85, 20+30*(i-startRow));
      } else {
        text(joined, 10, 20+30*(i-startRow));
      }
    }
  } else if (screen.equals("Y=") ) {//Y= display screen
    for (int i=0; i<10; i++) {
      text("Y"+i+"=", 40, 20+(30*i));
      drawCursor();//not sure if this is necessary here; will test later
      for (int j=0; j<graphInput.size (); j++) {
        String joined = combine(graphInput.get(j));
        if (joined.length()>0) {//displays inputted functions
          text(joined, 70, 20+30*j);
        }
      }
    }
  } else if (screen.equals("GRAPH")) {//the graph screen
    g.draw();//draws graph
  }
  for (int i=0; i<buttons.length; i++) {//the buttons are displayed no matter what the screen
    buttons[i].draw();
  }
}

void drawCursor() {
  if ((frameCount/30)%2==0) {//makes cursor blink
    stroke(0);
    fill(0);
  } else {
    stroke(255);
    fill(255);
  }
  rect(cursorX, cursorY, 5, 10);//fixed cursor dimensions (if there's a way to conform it to text width maybe that would be better but it doesn't really matter)
  stroke(0);
  fill(0);
}

void mouseClicked() {
  for (int i=0; i<buttons.length; i++) {//checks to see if each button is clicked
    if (buttons[i].isClicked()) {
      if (endRow>=input.size()-2) {//controls scrolling, yes?
        //input.remove(0); //we'd like to keep the old input if possible, yes?
        input.add(new ArrayList<String>());
        //startRow++;
      }   
      if (mode.equals("NORM")) { //what happens what buttons are clicked on the normal calculator screen
        if (buttons[i].name=="2nd") {//if 2nd clicked sets mode to 2nd
          mode = "2nd";
        } else if (buttons[i].name=="ALPHA") {//if Alpha clicked sets mode to Alpha
          mode = "ALPHA";
        } else if (buttons[i].name=="CLEAR") {//various functions of clear
          if (screen.equals("GRAPH")) {//Clear brings screen back from Graph to Norm
            screen="NORM";
          } else if (screen.equals("Y=")) {//Clear for Y= screen
            if (combine(graphInput.get(row)).length()>0) {
              graphInput.get(row).clear(); //clears current line only
              col=0;
            }
            cursorX=70;
          } else { //Clear when screen is normal. Clears everything
            if (combine(input.get(row)).length()>0) { //clears current row only
              input.get(row).clear();
              col=0;
            } else {
              for (int j=0; j<input.size (); j++) {//Clears everything
                input.get(j).clear();
                row=0;
              }
            }
            cursorX=11;//sets cursor back to the margin
            cursorY=7;//sets cursor back to the top
          }
        } else if (buttons[i].name=="ENTER") {//Enter button
          //displayOut = true;
          if (screen.equals("NORM")) {
            if (input.get(row).size()!=0) {
              lastEvaluated=combine(input.get(row));
              row++;
              if (row>8 && endRow-startRow>=8) {
                startRow++;
              } 
              endRow++;
              cursorY+=60;
            } else {
              cursorY+=30;
            }
            //System.out.println(lastEvaluated);
            String[] exps = lastEvaluated.split("->");
            switch (exps.length) {
            case 1:
              Ans = "~"+evaluateParens(exps[0]);
              input.get(row).add(Ans);
              break;
            case 2:
              Ans = "~"+evaluateParens(exps[0]);
              alphabet[exps[1].charAt(0)-'A']=Ans.substring(1);
              input.get(row).add(Ans);
              break;
            }
            row++;
            cursorX=11;//cursor back to margin
            //if (input.get(row-1).size()!=0) {
            //  row++;//row (of input?) increased by one
            //}
            col=0;
            endRow++;
            if (row>8 && endRow-startRow>=8) {
              startRow++;
              cursorY=7+30*8;
            }
          } else if (screen.equals("Y=")) {//Enter for Y= screen
            cursorY+=30; //moves cursor down a line
            cursorX = 70;
            row+=1;//moves down a line in graphInput
            col = 0;
          }
        } else if (buttons[i].name=="Y=") {//initializes Y= screen
          screen="Y=";
          cursorX = 70;
          cursorY = 7;
          col = 0;
          row = 0;
          if (combine(input.get(row)).length()>0) {//this might not be necessary
            input.get(row).clear();
            col=0;
          } else {
            for (int j=0; j<input.size (); j++) {//clears all input (might not be necessary either)
              input.get(j).clear();
              row=0;
            }
          }
        } else if (buttons[i].name=="GRAPH") {//switches screen to Graph when buttons are pressed
          screen="GRAPH";
        } else {//normal buttons 
          if (buttons[i].name=="STO->") {
            if (screen.equals("NORM")) {
              if (col!=0) {
                input.get(row).add(col, buttons[i].name.substring(3));
              } else {
                input.get(row).add(col, "Ans");
                input.get(row).add(col+1, buttons[i].name.substring(3));
                col++;
              }
            }
          } else if (buttons[i].name=="LOG" || buttons[i].name=="LN" ||
            buttons[i].name=="SIN" || buttons[i].name=="COS" || buttons[i].name=="TAN") {
            if (screen.equals("NORM")) {
              input.get(row).add(col, buttons[i].name.toLowerCase()+"("); //adds to input
            } else if (screen.equals("Y=")) {
              graphInput.get(row).add(col, buttons[i].name.toLowerCase()+"("); //adds to graphInput
            }
          } else if (buttons[i].name=="x^2" || buttons[i].name=="x^-1") {
            if (screen.equals("NORM")) { //adds to input
              if (col!=0) {
                input.get(row).add(col, buttons[i].name.substring(1));
              } else {
                input.get(row).add(col, "Ans");
                input.get(row).add(col+1, buttons[i].name.substring(1));
                col++;
              }
            } else if (screen.equals("Y=")) { //adds to graphInput
              graphInput.get(row).add(col, buttons[i].name.substring(1));
            }
          } else { //accounts for all other buttons (digits, operators)
            if (screen.equals("NORM")) { //adds to input
              input.get(row).add(col, buttons[i].name);
            } else if (screen.equals("Y=")) { //adds to graphInput
              graphInput.get(row).add(col, buttons[i].name);
              //System.out.println(buttons[i].name);
              //System.out.println("graphInput: "+graphInput.toString());
            }
          }
          cursorX+=textWidth(buttons[i].name); //moves cursor over
          col++;
        }
      } else if (mode.equals("2nd")) { //buttons in 2nd mode
        if (buttons[i].name=="2nd") { //changes mode back to norm
          mode = "NORM";
        } else if (buttons[i].name=="ALPHA") { //changes mode to Alpha (should do A-lock, no? Will fix if there's time)
          mode = "ALPHA";
        } else if (buttons[i].name=="CLEAR") { //Clear works the same as in normal mode (even in the Y= and Graph screens currently, which is a problem. I will fix this)
          if (combine(input.get(row)).length()>0) {
            input.get(row).clear();
            col=0;
          } else {
            for (int j=0; j<input.size (); j++) {
              input.get(j).clear();
              row=0;
            }
          }
        } else {//for all other buttons (these are grouped together because they affect the cursor, yes?)
          if (buttons[i].name=="(-)") {
            if (screen.equals("NORM")) {
              input.get(row).add(col, "Ans");
            } else if (screen.equals("Y=")) {
              graphInput.get(row).add(col, "Ans");
            }
          } else if (buttons[i].name=="x^2") {
            if (screen.equals("NORM")) {
              input.get(row).add(col, "sqrt(");
            } else if (screen.equals("Y=")) {
              graphInput.get(row).add(col, "sqrt(");
            }
          } else if (buttons[i].name=="LOG" || buttons[i].name=="LN") {
            if (screen.equals("NORM")) {
              input.get(row).add(col, buttons[i].sec.substring(0, buttons[i].sec.length()-1));
            } else if (screen.equals("Y=")) {
              graphInput.get(row).add(col, buttons[i].sec.substring(0, buttons[i].sec.length()-1));
            }
          } else if (buttons[i].name=="SIN" || buttons[i].name=="COS" || buttons[i].name=="TAN") {
            if (screen.equals("NORM")) {
              input.get(row).add(col, buttons[i].sec.toLowerCase()+"(");
            } else if (screen.equals("Y=")) {
              graphInput.get(row).add(col, buttons[i].sec.toLowerCase()+"(");
            }
          } else {
            if (screen.equals("NORM")) {
              input.get(row).add(col, buttons[i].sec);
            } else if (screen.equals("Y=")) {
              graphInput.get(row).add(col, buttons[i].sec);
            }
          }
          cursorX+=textWidth(buttons[i].sec);
          col++;
        }
        mode = "NORM"; //reverts mode back to norm after first button is pressed
      } else if (mode.equals("ALPHA")) { //buttons in alpha mode
        if (buttons[i].name=="2nd") {//works the same as in normal mode
          mode = "2nd";
        } else if (buttons[i].name=="ALPHA") {//works the same as in normal mode
          mode = "NORM";
        } else if (buttons[i].name=="CLEAR") {//works the same as in normal mode (maybe move these three outside of the overarching mode if statements to avoid repetition?)
          if (combine(input.get(row)).length()>0) {
            input.get(row).clear();
            col=0;
          } else {
            for (int j=0; j<input.size (); j++) {
              input.get(j).clear();
              row=0;
            }
          }
        } else {//all other buttons; just prints out letter/symbol
          if (screen.equals("NORM")) {
            input.get(row).add(col, buttons[i].alph);
          } else if (screen.equals("Y=")) {
            graphInput.get(row).add(col, buttons[i].alph);
          }
          cursorX+=textWidth(buttons[i].alph);
          col++;
        }
        mode = "NORM"; //reverts mode back to norm after first button is pressed
      }
    }
    //disp = combine(input);
  }
}
String evaluateFunctions(String fxn, String expression) {//Math with functions longer than one character, involving parentheses
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
  //if (expression.indexOf("Ans")!=-1) {
  expression=expression.replace("Ans", Ans.substring(1));
  //}
  for (int i=0; i<alphabet.length; i++) {//this is where the problem with multiple points is!!!!!
    if (!(""+(char)('A'+i)).equals("E")) {
      expression=expression.replace(""+(char)('A'+i), alphabet[i]);
    }
  }
  expression=expression.replace("π", ""+PI);
  expression=expression.replace("e", ""+exp(1));
  int startParen = 0;
  int endParen = 0;
  for (int i=0; i<expression.length (); i++) {//takes everything between the first complete overarching set of parentheses (in case of special functions yes?)
    if (expression.charAt(i)=='(') {
      startParen++;
    } else if (expression.charAt(i)==')') {
      endParen++;
    }
  }
  if (startParen>endParen) {
    while (startParen>endParen) {
      expression+=")";
      endParen++;
    }
  }
  expression=evaluateParensHelper(expression);//refers to helper function
  if (screen.equals("GRAPH")) {//does not round when graphing (messes up when it tries to round nonexistent points using x values outside the domain)
    return Double.parseDouble(expression);
  } else { //rounds to 10 decimal points
    java.math.BigDecimal bd = new java.math.BigDecimal(expression);
    bd = bd.setScale(10, java.math.BigDecimal.ROUND_HALF_UP);
    return(bd.doubleValue());
  }  
  /*while (expression.charAt (0)=='(' && expression.charAt(expression.length()-1)==')') {
   expression=expression.substring(1, expression.length()-1);
   }*/
  //return Double.parseDouble(expression);
}
String evaluateParensHelper(String expression) {//separates into parentheses not involved with functions
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
double evaluateMath(String expression) {//does simple arithmatic
  for (int i=1; i<expression.length ()-1; i++) {//does math
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
  //System.out.println(expression);
  String[] pemdas = {
    "+", "*", "/", "\\^"
  };
  String[] oper = expression.split("["+pemdas[delimiter]+"]");
  //System.out.println(oper[0]);
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
      //System.out.println("reached this point");
      //System.out.println(oper[k]);
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
