Button[] buttons;
Graphs g;
ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<String>> graphInput = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<String>> windowInput = new ArrayList<ArrayList<String>>();
int row = 0;
int col = 0;
int yRow = 0;
int yCol = 0;
int wRow = 0;
int wCol = 0;
int zRow = 0;
String lastEvaluated = "";
String Ans = "~0";
String disp = "";
boolean displayOut = false;
boolean on = false;
float cursorX = 11;
float cursorY = 7;
int startRow = 0;
int endRow = 1;
String[] functions;
String mode = "NORM";
String screen = "NORM";
String[] alphabet = new String[26];
boolean overWrite=true;
String inbefore = "";
String in = "";
boolean error = false;

void setup() {
  size(500, 700); 
  background(196, 224, 190);
  frame.setTitle("FINGER O' DEATH 83++");
  fill(0);
  rect(cursorX, 20, 5, 10);
  PFont font = loadFont("Monospaced.bold-48.vlw");
  textFont(font, 12);
  for (int i=0; i<8; i++) {
    input.add(new ArrayList<String>());
  }
  for (int j=0; j<10; j++) {
    graphInput.add(new ArrayList<String>());
  }
  for (int k=0; k<6; k++) {
    windowInput.add(new ArrayList<String>());
  }
  windowInput.get(0).add("-10");
  windowInput.get(1).add("10");
  windowInput.get(2).add("1");
  windowInput.get(3).add("-10");
  windowInput.get(4).add("10");
  windowInput.get(5).add("1");
  for (int i=0; i<alphabet.length; i++) {
    alphabet[i] = "0.0";
  }

  g = new Graphs();

  buttons = new Button[51];
  buttons[0] = new Button(0, height/2-height/2/10, width/5, height/20, "Y=", "", "", 170);
  buttons[1] = new Button(1*width/5, height/2-height/2/10, width/5, height/20, "WINDOW", "", "", 170);
  buttons[2] = new Button(2*width/5, height/2-height/2/10, width/5, height/20, "ZOOM", "", "", 170);
  buttons[3] = new Button(3*width/5, height/2-height/2/10, width/5, height/20, "TRACE", "", "", 170);
  buttons[4] = new Button(4*width/5, height/2-height/2/10, width/5, height/20, "GRAPH", "", "", 170);

  buttons[5] = new Button(0, height/2+(0*height/2/10), "2nd", "", "", 0, 0, 255, 0);
  buttons[6] = new Button(1*width/5, height/2+(0*height/2/10), "X", "QUIT", "");
  buttons[7] = new Button(2*width/5, height/2+(0*height/2/10), "DEL", "INS", "");
  buttons[8] = new Button(15*width/20, height/2+(0*height/2/10)+3, width/10, height/20-height/40+1, "N", "", "", 170);

  buttons[9] = new Button(0, height/2+(1*height/2/10), "ALPHA", "", "", 0, 255, 0, 0);
  buttons[10] = new Button(1*width/5, height/2+(1*height/2/10), "MODE", "", "");
  buttons[11] = new Button(2*width/5, height/2+(1*height/2/10), "STAT", "", "");
  buttons[12] = new Button(13*width/20, height/2+(0.5*height/2/10)+5, width/10, height/20-height/40+1, "W", "", "", 170);
  buttons[13] = new Button(15*width/20, height/2+(1*height/2/10)+6, width/10, height/20-height/40+1, "S", "", "", 170);
  buttons[14] = new Button(17*width/20, height/2+(0.5*height/2/10)+5, width/10, height/20-height/40+1, "E", "", "", 170);

  buttons[15] = new Button(0, height/2+(2*height/2/10), "MATH", "", "A");
  buttons[16] = new Button(1*width/5, height/2+(2*height/2/10), "APPS", "", "B");
  buttons[17] = new Button(2*width/5, height/2+(2*height/2/10), "PRGM", "", "C");
  buttons[18] = new Button(3*width/5, height/2+(2*height/2/10), "VARS", "", "");
  buttons[19] = new Button(4*width/5, height/2+(2*height/2/10), "CLEAR", "", "");

  buttons[20] = new Button(0, height/2+(3*height/2/10), "x^(-)1", "", "D");
  buttons[21] = new Button(1*width/5, height/2+(3*height/2/10), "SIN", "aSIN", "");
  buttons[22] = new Button(2*width/5, height/2+(3*height/2/10), "COS", "aCOS", "F");
  buttons[23] = new Button(3*width/5, height/2+(3*height/2/10), "TAN", "aTAN", "G");
  buttons[24] = new Button(4*width/5, height/2+(3*height/2/10), width/5, height/20, "^", "π", "H", 170);

  buttons[25] = new Button(0, height/2+(4*height/2/10), "x^2", "SQRT", "I");
  buttons[26] = new Button(1*width/5, height/2+(4*height/2/10), width/5, height/20+height/20/5, ",", "", "J", 225);
  buttons[27] = new Button(2*width/5, height/2+(4*height/2/10), width/5, height/20+height/20/5, "(", "", "K", 225);
  buttons[28] = new Button(3*width/5, height/2+(4*height/2/10), width/5, height/20+height/20/5, ")", "", "L", 225);
  buttons[29] = new Button(4*width/5, height/2+(4*height/2/10), width/5, height/20, "/", "e", "M", 170);

  buttons[30] = new Button(0, height/2+(5*height/2/10), "LOG", "10^x", "N");
  buttons[31] = new Button(1*width/5, height/2+(5*height/2/10)+height/20/5, width/5, height/20+height/20/5, "7", "", "O", 225);
  buttons[32] = new Button(2*width/5, height/2+(5*height/2/10)+height/20/5, width/5, height/20+height/20/5, "8", "", "P", 225);
  buttons[33] = new Button(3*width/5, height/2+(5*height/2/10)+height/20/5, width/5, height/20+height/20/5, "9", "", "Q", 225);
  buttons[34] = new Button(4*width/5, height/2+(5*height/2/10), width/5, height/20, "*", "", "R", 170);

  buttons[35] = new Button(0, height/2+(6*height/2/10), "LN", "e^x", "S");
  buttons[36] = new Button(1*width/5, height/2+(6*height/2/10)+2*height/20/5, width/5, height/20+height/20/5, "4", "", "T", 225);
  buttons[37] = new Button(2*width/5, height/2+(6*height/2/10)+2*height/20/5, width/5, height/20+height/20/5, "5", "", "U", 225);
  buttons[38] = new Button(3*width/5, height/2+(6*height/2/10)+2*height/20/5, width/5, height/20+height/20/5, "6", "", "V", 225);
  buttons[39] = new Button(4*width/5, height/2+(6*height/2/10), width/5, height/20, "-", "", "W", 170);

  buttons[40] = new Button(0, height/2+(7*height/2/10), "STO->", "Ans", "X");
  buttons[41] = new Button(1*width/5, height/2+(7*height/2/10)+3*height/20/5, width/5, height/20+height/20/5, "1", "", "Y", 225);
  buttons[42] = new Button(2*width/5, height/2+(7*height/2/10)+3*height/20/5, width/5, height/20+height/20/5, "2", "", "Z", 225);
  buttons[43] = new Button(3*width/5, height/2+(7*height/2/10)+3*height/20/5, width/5, height/20+height/20/5, "3", "", "", 225);
  buttons[44] = new Button(4*width/5, height/2+(7*height/2/10), width/5, height/20, "+", "", "''", 170);

  buttons[45] = new Button(0, height/2+(8*height/2/10), width/5, height/20+5*height/20/5, "ON", "OFF", "", 125);
  buttons[46] = new Button(1*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, "0", "", "", 225);
  buttons[47] = new Button(2*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, ".", "", "", 225);
  buttons[48] = new Button(3*width/5, height/2+(8*height/2/10)+4*height/20/5, width/5, height/20+height/20/5, "(-)", "", "", 225);
  buttons[49] = new Button(4*width/5, height/2+(8*height/2/10), width/5, height/20+5*height/20/5, "ENTER", "", "", 170);
  buttons[50] = new Button(4*width/5, height/2+(2*height/2/10), "CLEAR", "", "");
}

void draw() {
  if (on) {
    fill(0);
    textAlign(LEFT, BOTTOM);
    background(196, 224, 190);
    rect(0, height/2-40, width, height);
    if (mode.equals("2nd")) {
      buttons[5].colText = 255;
      buttons[9].colText = 0;
    } else if (mode.equals("ALPHA")) {
      buttons[5].colText = 0;
      buttons[9].colText = 255;
    } else {
      buttons[5].colText = 0;
      buttons[9].colText = 0;
    }
    if (overWrite) {
      buttons[7].greySecond = false;
    } else {
      buttons[7].greySecond = true;
    }  
    textSize(12);
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
        drawCursor();
        for (int j=0; j<graphInput.size (); j++) {
          String joined = combine(graphInput.get(j));
          if (joined.length()>0) {//displays inputted functions
            text(joined, 70, 20+30*j);
          }
        }
      }
    } else if (screen.equals("GRAPH")) {//the graph screen
      g.draw();//draws graph
    } else if (screen.equals("WINDOW")) {
      String names = "Xmin=Xmax=Xscl=Ymin=Ymax=Yscl=";
      for (int i=0; i<6; i++) {
        String n = names.substring(i*5, (i*5)+5);
        text(n, 65-textWidth(n), 20+(30*i));
        drawCursor();
        for (int j=0; j<windowInput.size (); j++) {
          String joined = combine(windowInput.get(j));
          if (joined.length()>0) {//displays inputted functions
            text(joined, 70, 20+30*j);
          }
        }
      }
    } else if (screen.equals("ZOOM")) {
      ArrayList<String> names = new ArrayList<String>();
      names.add("1:ZStandard");
      names.add("2:ZTrig");
      for (int i=0; i<2; i++) {
        text(names.get(i), 70, 20+(30*i));
        drawCursor();
      }
    }
  } else {
    background(196, 224, 190);
    fill(0);
    rect(0, height/2-40, width, height);
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
    stroke(196, 224, 190);
    fill(196, 224, 190);
  }
  rect(cursorX, cursorY, 7.25, 10);//fixed cursor dimensions 
  stroke(0);
  fill(0);
}

void CLEAR() {
  if (screen.equals("GRAPH") || screen.equals("ZOOM")) {//Clear brings screen back from Graph to Norm
    screen="NORM";
  } else if (screen.equals("Y=")) {//Clear for Y= screen
    if (combine(graphInput.get(yRow)).length()>0) {
      graphInput.get(yRow).clear(); 
      yCol=0;
    }
    cursorX=70;
  } else if (screen.equals("WINDOW")) {
    if (combine(windowInput.get(wRow)).length()>0) {
      windowInput.get(wRow).clear();
      wCol=0;
    }
    cursorX=70;
  } else { //Clear when screen is normal. Clears everything
    if (input.get(row).size()==0) {
      startRow=row;
      endRow=row+1;
      cursorY=7;//sets cursor back to the top
    } else { 
      input.get(row).clear();
      col=0;
    }
    cursorX=11;//sets cursor back to the margin
  }
}

void ENTER() {
  if (mode.equals("NORM")) {
    if (screen.equals("NORM")) {
      if (input.get(row).size()!=0) {
        lastEvaluated=combine(input.get(row));
        row++;
        if (row>8 && endRow-startRow>=9) {
          startRow++;
        } 
        endRow++;
        cursorY+=60;
      } else {
        cursorY+=30;
      }
      String[] exps = lastEvaluated.split("->");
      switch (exps.length) {
      case 1:
        evaluateParens(exps[0]);
        if (error) {
          Ans = "~ERROR";
          error = false;
        } else {
          Ans = "~"+evaluateParens(exps[0]);
        }
        input.get(row).add(Ans);
        break;
      case 2:
        if (exps[1].length()!=1 || exps[1].charAt(0)=='E' || (exps[1].charAt(0)<'A' || exps[1].charAt(0)>'Z')) {
          error = true;
          Ans = "~ERROR";
        } else {
          evaluateParens(exps[0]);
          if (error) {
            Ans = "~ERROR";
          } else {
            Ans = "~"+evaluateParens(exps[0]);
          }
          alphabet[exps[1].charAt(0)-'A']=Ans.substring(1);
          input.get(row).add(Ans);
          break;
        }
      }
      row++;
      cursorX=11;//cursor back to margin
      col=0;
      endRow++;
      if (row>8 && endRow-startRow>=10) {
        startRow++;
        cursorY=7+30*8;
      }
    } else if (screen.equals("Y=")) {//Enter for Y= screen
      cursorY+=30; //moves cursor down a line
      cursorX = 70;
      yRow+=1;//moves down a line in graphInput
      yCol = 0;
    } else if (screen.equals("WINDOW")) {//ENTER for Window screen
      cursorY+=30;//moves cursor down a line
      cursorX = 70;
      wRow+=1;//moves down a line in windowInput
      wCol = 0;
    } else if (screen.equals("ZOOM")) {
      for (int i=0; i<6; i++) {
        windowInput.get(i).clear();
      }
      if (zRow==0) {//ZStandard
        windowInput.get(0).add("-10");//Xmin
        windowInput.get(1).add("10");//Xmax
        windowInput.get(2).add("1");//Xscl
        windowInput.get(3).add("-10");//Ymin
        windowInput.get(4).add("10");//Ymax
        windowInput.get(5).add("1");//Yscl
      } else if (zRow==1) {//ZTrig
        windowInput.get(0).add("-2*π");//Xmin
        windowInput.get(1).add("2*π");//Xmax
        windowInput.get(2).add("π/2");//Xscl
        windowInput.get(3).add("-4");//Ymin
        windowInput.get(4).add("4");//Ymax
        windowInput.get(5).add("1");//Yscl
      }
      screen="GRAPH";
    }
  }
}

void specialFunctions(int i) {
  in = buttons[i].name.toLowerCase()+"(";
  ad();
} 

void specialExponents(int i) {
  if (screen.equals("NORM") ) {
    if (col==0) {
      inbefore = "Ans";
    }
  } else if (screen.equals("Y=") ) {
    if (yCol==0) {
      inbefore = "Ans";
    }
  } else if (screen.equals("WINDOW")) {
    if (wCol==0) {
      inbefore = "Ans";
    }
  }
  in = buttons[i].name.substring(1);
  ad();
}

void normalButtons(int i) {
  //operators
  if (buttons[i].name.equals("+") || buttons[i].name.equals("-") || buttons[i].name.equals("*")
    || buttons[i].name.equals("/") || buttons[i].name.equals("^")) {
    if (screen.equals("NORM")) {
      if (col==0) {
        inbefore = "Ans";
      }
    } else if (screen.equals("Y=")) {
      if (yCol==0) {
        inbefore = "Ans";
      }
    } else if (screen.equals("WINDOW")) {
      if (wCol==0) {
        inbefore = "Ans";
      }
    }
  }
  in = buttons[i].name;
  ad();
}

void ad() {
  if (screen.equals("NORM")) { //adds to input
    if (combine(input.get(row)).length()<45 || (overWrite && col<input.get(row).size())) {
      if (!overWrite || col>=input.get(row).size()) {
        if (!(inbefore.equals(""))) {
          input.get(row).add(col, inbefore);
          cursorX+=textWidth(inbefore);
          col++;
        }
        if (!(in.equals(""))) {
          input.get(row).add(col, in);
          cursorX+=textWidth(in);
          col++;
        }
        overWrite=true;
      } else if (overWrite) {
        if (!(inbefore.equals(""))) {
          input.get(row).set(col, inbefore);
          cursorX+=textWidth(inbefore);
          col++;
        }
        if (!(in.equals(""))) {
          input.get(row).set(col, in);
          cursorX+=textWidth(in);
          col++;
        }
      }
    }
  } else if (screen.equals("Y=")) { //adds to graphInput
    if (combine(graphInput.get(yRow)).length()<30 || (overWrite && yCol<graphInput.get(yRow).size())) {
      if (!overWrite || yCol>=graphInput.get(yRow).size()) {
        if (!(inbefore.equals(""))) {
          graphInput.get(yRow).add(yCol, inbefore);
          cursorX+=textWidth(inbefore);
          yCol++;
        }
        if (!(in.equals(""))) {
          graphInput.get(yRow).add(yCol, in);
          cursorX+=textWidth(in);
          yCol++;
        }
        overWrite=true;
      } else if (overWrite) {
        if (!(inbefore.equals(""))) {
          graphInput.get(yRow).set(yCol, inbefore);
          cursorX+=textWidth(inbefore);
          yCol++;
        }
        if (!(in.equals(""))) {
          graphInput.get(yRow).set(yCol, in);
          cursorX+=textWidth(in);
          yCol++;
        }
      }
    }
  } else if (screen.equals("WINDOW")) {
    if (combine(windowInput.get(wRow)).length()<35 || (overWrite && wCol<windowInput.get(wRow).size())) {
      if (!overWrite || wCol>=windowInput.get(wRow).size()) {
        if (!(inbefore.equals(""))) {
          windowInput.get(wRow).add(wCol, inbefore);
          cursorX+=textWidth(inbefore);
          wCol++;
        }
        if (!(in.equals(""))) {
          windowInput.get(wRow).add(wCol, in);
          cursorX+=textWidth(in);
          wCol++;
        }
        overWrite=true;
      } else if (overWrite) {
        if (!(inbefore.equals(""))) {
          windowInput.get(wRow).set(wCol, inbefore);
          cursorX+=textWidth(inbefore);
          wCol++;
        }
        if (!(in.equals(""))) {
          windowInput.get(wRow).set(wCol, in);
          cursorX+=textWidth(in);
          wCol++;
        }
      }
    }
  }
  in = "";
  inbefore = "";
}

void mouseClicked() {
  for (int i=0; i<buttons.length; i++) {//checks to see if each button is clicked
    if (buttons[i].isClicked()) {
      if (on) {      
        if (endRow>=input.size()-2) {
          input.add(new ArrayList<String>());
        }
        if (buttons[i].name.equals("N")) {
          if (!screen.equals("NORM")) {
            if (screen.equals("Y=")) {
              yRow--;
              cursorX=70+textWidth(combine(graphInput.get(yRow)));
              yCol=graphInput.get(yRow).size();
            } else if (screen.equals("WINDOW")) {
              wRow--;
              cursorX=70+textWidth(combine(windowInput.get(wRow)));
              wCol=windowInput.get(wRow).size();
            } else if (screen.equals("ZOOM")) {
              zRow--;
            }
            cursorY-=30;
          }
        } else if (buttons[i].name.equals("E")) {
          if (screen.equals("NORM")) {
            if (col<input.get(row).size()) {
              cursorX+=textWidth(input.get(row).get(col));
              col++;
            }
          } else if (screen.equals("Y=")) {
            if (yCol<graphInput.get(yRow).size()) {
              cursorX+=textWidth(graphInput.get(yRow).get(yCol));
              yCol++;
            }
          } else if (screen.equals("WINDOW")) {
            if (wCol<windowInput.get(row).size()) {
              cursorX+=textWidth(windowInput.get(wRow).get(wCol));
              wCol++;
            }
          }
        } else if (buttons[i].name.equals("S")) {
          if (!screen.equals("NORM")) {
            if (screen.equals("Y=")) {
              yRow++;
              cursorX=70+textWidth(combine(graphInput.get(yRow)));
              yCol=graphInput.get(yRow).size();
            } else if (screen.equals("WINDOW")) {
              wRow++;
              cursorX=70+textWidth(combine(windowInput.get(wRow)));
              wCol=windowInput.get(wRow).size();
            } else if (screen.equals("ZOOM")) {
              zRow++;
            }
            cursorY+=30;
          }
        } else if (buttons[i].name.equals("W")) {
          if (screen.equals("NORM")) {
            if (col>0) {
              col--;
              cursorX-=textWidth(input.get(row).get(col));
            }
          } else if (screen.equals("Y=")) {
            if (yCol>0 && yCol<graphInput.get(yRow).size()) {
              yCol--;
              cursorX-=textWidth(graphInput.get(yRow).get(yCol));
            }
          } else if (screen.equals("WINDOW")) {
            if (wCol>0) {
              wCol--;
              cursorX-=textWidth(windowInput.get(wRow).get(wCol));
            }
          }
        } else if (buttons[i].name.equals("WINDOW")) {
          screen = "WINDOW";
          cursorX = 70;
          cursorY = 7;
        } else if (buttons[i].name.equals("ZOOM")) {
          screen = "ZOOM";
          cursorX = 70;
          if (zRow==0) {
            cursorY = 7;
          } else if (zRow==1) {
            cursorY = 37;
          }
        } else if (mode.equals("NORM")) { //what happens what buttons are clicked on the normal calculator screen
          if (buttons[i].name.equals("2nd")) {//if 2nd clicked sets mode to 2nd
            mode = "2nd";
          } else if (buttons[i].name.equals("ALPHA")) {//if Alpha clicked sets mode to Alpha
            mode = "ALPHA";
          } else if (buttons[i].name.equals("CLEAR")) {//various functions of clear
            CLEAR();
          } else if (buttons[i].name.equals("ENTER")) {//Enter button
            ENTER();
          } else if (buttons[i].name.equals("Y=")) {//initializes Y= screen
            screen="Y=";
            cursorX = 70;
            cursorY = 7;
            yCol = 0;
            yRow = 0;
          } else if (buttons[i].name.equals("GRAPH")) {//switches screen to Graph when buttons are pressed
            screen="GRAPH";
          } else if (buttons[i].name.equals("DEL")) {
            if (screen.equals("NORM")) {
              if (col<input.get(row).size()) {
                input.get(row).remove(col);
              }
            } else if (screen.equals("Y=")) {
              if (yCol<graphInput.get(yRow).size()) {
                graphInput.get(yRow).remove(yCol);
              }
            } else if (screen.equals("WINDOW")) {
              if (wCol<windowInput.get(wRow).size()) {
                input.get(wRow).remove(wCol);
              }
            }
          } else if (!buttons[i].name.equals("ON") && !buttons[i].name.equals("MATH") &&
            !buttons[i].name.equals("APPS") && !buttons[i].name.equals("PRGM") && !buttons[i].name.equals("VARS") &&
            !buttons[i].name.equals("STAT") && !buttons[i].name.equals("MODE") && !buttons[i].name.equals("TRACE")) {//NORMAL BUTTONS 
            if (buttons[i].name.equals("STO->")) {
              if (screen.equals("NORM")) {
                if (col==0) {
                  inbefore = "Ans";
                }
                in = buttons[i].name.substring(3);
                ad();
              }
            } else if (buttons[i].name.equals("LOG") || buttons[i].name.equals("LN") ||
              buttons[i].name.equals("SIN") || buttons[i].name.equals("COS") || buttons[i].name.equals("TAN")) {
              specialFunctions(i);
            } else if (buttons[i].name.equals("x^2") || buttons[i].name.equals("x^(-)1")) {
              specialExponents(i);
            } else { //accounts for all other buttons (digits, operators)
              normalButtons(i);
            }
          }
        } else if (mode.equals("2nd")) { //buttons in 2nd mode
          if (buttons[i].name.equals("2nd")) { //changes mode back to norm
            mode = "NORM";
          } else if (buttons[i].name.equals("ALPHA")) { 
            mode = "ALPHA";
          } else if (buttons[i].name.equals("CLEAR")) { //Clear works the same as in normal mode (even in the Y= and Graph screens currently, which is a problem. I will fix this)
            CLEAR();
          } else if (buttons[i].name.equals("DEL")) {
            overWrite=!overWrite;
          } else if (buttons[i].name.equals("X")) {
            screen = "NORM";
            CLEAR();
          } else if (buttons[i].name.equals("ON")) {
            on = false;
            buttons[5].colText = 0;
            buttons[7].greySecond = false;
            buttons[9].colText = 0;
          } else {
            if (buttons[i].name.equals("STO->")) {
              in = "Ans";
            } else if (buttons[i].name.equals("x^2")) {
              in = "sqrt(";
            } else if (buttons[i].name.equals("LOG") || buttons[i].name.equals("LN")) {
              in = buttons[i].sec.substring(0, buttons[i].sec.length()-1);
            } else if (buttons[i].name.equals("SIN") || buttons[i].name.equals("COS") || buttons[i].name.equals("TAN")) {
              in = buttons[i].sec.toLowerCase()+"(";
            } else {
              in = buttons[i].sec;
            }
            ad();
          }
          if (mode.equals("2nd")) {
            mode = "NORM"; //reverts mode back to norm after first button is pressed
          }
        } else if (mode.equals("ALPHA")) { //buttons in alpha mode
          if (buttons[i].name.equals("2nd")) {//works the same as in normal mode
            mode = "2nd";
          } else if (buttons[i].name.equals("ALPHA")) {//works the same as in normal mode
            mode = "NORM";
          } else if (buttons[i].name.equals("CLEAR")) {//works the same as in normal mode (maybe move these three outside of the overarching mode if statements to avoid repetition?)
            CLEAR();
          } else {//all other buttons; just prints out letter/symbol
            in = buttons[i].alph;
            ad();
          }
          if (mode.equals("ALPHA")) {
            mode = "NORM"; //reverts mode back to norm after first button is pressed
          }
        }
      } else {
        if (buttons[i].name.equals("ON")) {
          on = true;
        }
      }
    }
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
  for (int el=0; el<expression.length (); el++) {
    if (el!=0 && expression.substring(el, el+1).equals("(") && expression.substring(el-1, el).matches("[0-9]+")) {//implied multiplication
      expression=expression.substring(0, el)+"*"+expression.substring(el);
    } else if (el!=expression.length()-1 && expression.substring(el, el+1).equals(")") && expression.substring(el+1, el+2).matches("[0-9]+")) {//implied multiplication
      expression=expression.substring(0, el+1)+"*"+expression.substring(el);
    }
    if (el!=0 && el!=expression.length()-1 && expression.substring(el, el+1).matches("[+\\-/*^]") && expression.substring(el+1, el+2).matches("[+\\-/*^]")) {
      error = true;
      return 0;
    }
    if (expression.length()>=6 && el<=expression.length()-5) {
      if (expression.substring(el, el+4).equals("*(-)")) {
        int lastDigit = el-1;
        for (int i=el; i>=0; i--) {
          if (!expression.substring(i, i+1).matches("[0-9]+")) {
            lastDigit = i-1;
          }
        }
        expression = expression.substring(0, lastDigit)+"(-)"+expression.substring(lastDigit, el+1)+expression.substring(el+4);
        for (int em=0; em<expression.length (); em++) {
          if (em==0) {
            if (expression.length()>=3) {
              if (expression.substring(0, 3).equals("(-)")) {
                expression = "0-"+expression.substring(3);
              }
            }
          }
        }
      }
    }
    if (expression.length()>=6 && el<=expression.length()-5) {
      if (expression.substring(el, el+4).equals("/(-)")) {
        int lastDigit = el-1;
        for (int i=el; i>=0; i--) {
          if (!expression.substring(i, i+1).matches("[0-9]+")) {
            lastDigit = i-1;
          }
        }
        expression = expression.substring(0, lastDigit)+"(-)"+expression.substring(lastDigit, el+1)+expression.substring(el+4);
        for (int em=0; em<expression.length (); em++) {
          if (em==0) {
            if (expression.length()>=3) {
              if (expression.substring(0, 3).equals("(-)")) {
                expression = "0-"+expression.substring(3);
              }
            }
          }
        }
      }
    }
    if (expression.length()>=6 && el<=expression.length()-5) {
      if (expression.substring(el, el+4).equals("^(-)")) {
        int lastDigit = el-1;
        for (int i=el; i>=0; i--) {
          if (!expression.substring(i, i+1).matches("[0-9]+")) {
            lastDigit = i-1;
          }
        }
        expression = "1/("+expression.substring(0, el+1)+expression.substring(el+4)+")";
      }
    }
    if (el==0 && expression.length()>=3 && expression.substring(0, 3).equals("(-)")) {
      expression = "0-"+expression.substring(3);
    }
    if (expression.length()>=4 && el<=expression.length()-4 && expression.substring(el, el+4).equals("-(-)")) {
      expression = expression.substring(0, el)+"+"+expression.substring(el+4);
    } else if (expression.length()>=4 && el<=expression.length()-4 && expression.substring(el, el+4).equals("+(-)")) {
      expression = expression.substring(0, el)+"-"+expression.substring(el+4);
    }
  }
  expression=expression.replace(")(", ")*(");
  expression=expression.replace("Ans", Ans.substring(1));
  for (int i=0; i<alphabet.length; i++) {
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
    try {
      return Double.parseDouble(expression);
    } 
    catch (Exception e) {
      error = true;
      return 0;
    }
  } else { //rounds to 9 decimal points
    try {
      java.math.BigDecimal bd = new java.math.BigDecimal(Double.parseDouble(expression));
      bd = bd.setScale(9, java.math.BigDecimal.ROUND_HALF_UP);
      return(bd.doubleValue());
    } 
    catch (NumberFormatException e) {
      try {
        return Double.parseDouble(expression);
      }
      catch(NumberFormatException f) {
        error = true;
        return 0;
      }
    }
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
  try {
    return evaluateMath(expression)+"";
  }
  catch(NumberFormatException e) {
    return "ERROR";
  }
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
      try {
        out = Double.parseDouble(oper[k]);
      }
      catch(NumberFormatException e) {
        return "ERROR";
      }
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

