ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
String lastEvaluated = "";
//gotten from Window
String Ans;
float xMin;
float xMax;
float xScl;
float yMin;
float yMax;
float yScl;

//computed from Window values
float pixelXScl; //number of pixels to make each x on the graph increase by 1
float pixelYScl; //number of pixels to make each y on the graph increase by 1
float x0; //xcor of y-axis; where x=0;
float y0; //ycor of x-axis; where y=0;

//size of display screen
float gridWidth;
float gridHeight;
float margin;

void setup() {
  size(500, 700);
  background(255);
  input.add(new ArrayList<String>());
  input.get(0).add("X");
}

void draw() {
  xMin = -10;
  xMax = 10;
  xScl = 1;
  yMin = -10;
  yMax = 10;
  yScl = 1;
  pixelXScl = (width-20)/(xMax-xMin); //number of pixels to make each x on the graph increase by 1
  pixelYScl = ((height/2)-55)/(yMax-yMin); //number of pixels to make each y on the graph increase by 1
  x0 = 10+abs(xMin)*pixelXScl; //xcor of y-axis; where x=0;
  y0 = 10+yMax*pixelYScl; //ycor of x-axis; where y=0;
  gridWidth = width-20;
  gridHeight = (height/2)-55;
  margin = 10;
  background(255);

  graph(input);
}

void graph(ArrayList<ArrayList<String>> functions) {
  grid();
  plug(functions);
}

void grid() {
  for (float xcor=margin; xcor<=margin+gridWidth; xcor+=pixelXScl*xScl) {//vertical lines
    stroke(225);
    line(xcor, margin, xcor, gridHeight+margin);
  }
  for (float ycor=margin; ycor<=gridHeight+margin; ycor+=pixelYScl*yScl) {//horizontal lines
    stroke(225);
    line(margin, ycor, margin+gridWidth, ycor);
  }
  stroke(0);
  line(x0, margin, x0, margin+gridHeight);//y axis
  line(margin, y0, margin+gridWidth, y0);//x-axis

  stroke(100);
  noFill();
  rect(10, 10, gridWidth, (gridHeight));//border of display screen
  stroke(0);
}

void plug(ArrayList<ArrayList<String>> functions) {//graphs all functions inputted into the Y= screen  

  for (int k=0; k<functions.size (); k++) {
    ArrayList<String> plugged = new ArrayList<String>();
    if (functions.get(k).size()!=0) {
      //finds all y values for all x values on the graph, with a 0.01 scale
      //is this enough? Some graphs look sketchier than others. Will try connecting points and/or making scale smaller
      for (float x=xMin; x<=xMax; x+=0.01) {
        for (int i=0; i<functions.get (k).size(); i++) {
          if (functions.get(k).get(i).equals("X")) {//plugs in x value for every "X" in the input
            plugged.add(""+x);
          } else {
            System.out.println(functions.get(k).get(i));
            plugged.add(functions.get(k).get(i)); 
            System.out.println(plugged);
          }
        }
        plotPoint(x, (float)evaluateParens(plugged));//plots the point
        plugged.clear();
      }
    }
  }
}

void plotPoint(float x, float y) {
  fill(255, 0, 0);
  float xcor = x0+(x*pixelXScl);//(xcor of y-axis) + x(using the right ratio of pixels to x values)
  float ycor = y0-(y*pixelYScl);//(xcor of x-axis) + y(using the right ratio of pixels to y values)
  if (ycor>=margin && ycor<=margin+gridHeight) {
    ellipse(xcor, ycor, 0.05, 0.05);
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
      //System.out.println("evaluateParens("+expression.substring(0, start)+")+evaluateParens("+expression.substring(start, i)+")'"+expression.substring(i+1)+"')");
      //System.out.println("evaluateParens("+expression.substring(0, start)+")+evaluateParens("+expression.substring(start+1, i)+")'"+expression.substring(i+1)+"')");
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
  //System.out.println(expression);
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
