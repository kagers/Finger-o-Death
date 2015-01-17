ArrayList<ArrayList<String>> input = new ArrayList<ArrayList<String>>();
String lastEvaluated = "";
String Ans = "";

void setup() {
  size(500, 700);
  background(255);
  input.add(new ArrayList<String>());
  input.get(0).add("X");
}

void draw() {
  background(255);
  //grid(-5, 15, 1, -10, 10, 1);
  graph(input);
}

void graph(ArrayList<ArrayList<String>> functions){
  float xMin = -10;
  float xMax = 10;
  float xScl = 1;
  float yMin = -10;
  float yMax = 10;
  float yScl = 1;
  float pixelXScl = (width-20)/(xMax-xMin); //number of pixels to make each x on the graph increase by 1
  float pixelYScl = ((height/2)-55)/(yMax-yMin); //number of pixels to make each y on the graph increase by 1
  float x0 = 10+abs(xMin)*pixelXScl; //xcor of y-axis; where x=0;
  float y0 = 10+yMax*pixelYScl; //ycor of x-axis; where y=0;
  float gridWidth = width-20;
  float gridHeight = (height/2)-55;
  float margin = 10;
  
  grid(xScl, pixelXScl, yScl, pixelYScl, gridWidth, gridHeight, margin, x0, y0);
  plug(functions, xMin, xMax, pixelXScl, pixelYScl, gridHeight, margin, x0, y0);
}

void grid(float xScl, float pixelXScl, float yScl, float pixelYScl, float gridWidth, float gridHeight, float margin, float x0, float y0) {
  for(float xcor=margin; xcor<=margin+gridWidth; xcor+=pixelXScl*xScl){//vertical lines
    stroke(225);
    line(xcor, margin, xcor, gridHeight+margin);
  }
  for(float ycor=margin; ycor<=gridHeight+margin; ycor+=pixelYScl*yScl){//horizontal lines
    stroke(225);
    line(margin, ycor, margin+gridWidth, ycor);
  }
  stroke(0);
  line(x0, margin, x0, margin+gridHeight);//y axis
  line(margin, y0, margin+gridWidth, y0);//x-axis
  
  stroke(100);
  noFill();
  rect(10,10,gridWidth,(gridHeight));//border of display screen
  stroke(0);
}

//void grid(float xMin, float xMax, float xScl, float yMin, float yMax, float yScl) {
//  float pixelXScl = (width-20)/(xMax-xMin); //number of pixels to make each x on the graph increase by 1
//  for(float xcor=10; xcor<=width-10; xcor+=pixelXScl*xScl){//graph x-coordinates
//    stroke(225);
//    line(xcor, 10, xcor, (height/2)-45);
//  }
//  float pixelYScl = ((height/2)-55)/(yMax-yMin); //number of pixels to make each y on the graph increase by 1
//  for(float ycor=10; ycor<=(height/2)-55; ycor+=pixelYScl*yScl){//graph x-coordinates
//    stroke(225);
//    line(10, ycor, width-10, ycor);
//  }
//  stroke(0);
//  line(10+abs(xMin)*pixelXScl, 10, 10+abs(xMin)*pixelXScl, (height/2)-45);//y axis
//  line(10, 10+yMax*pixelYScl, width-10, 10+yMax*pixelYScl);//x-axis
//  
//  stroke(255,0,0);
//  noFill();
//  rect(10,10,width-20,(height/2)-55);
//  stroke(0);
//}

void plug(ArrayList<ArrayList<String>> functions, float xMin, float xMax, float pixelXScl, float pixelYscl, float gridHeight, float margin, float x0, float y0) {//graphs all functions inputted into the Y= screen  

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
        plotPoint(x, (float)evaluateParens(plugged), pixelXScl, pixelYscl, gridHeight, margin, x0, y0);//plots the point
        plugged.clear();
      }
    }
  }
}

void plotPoint(float x, float y, float pixelXScl, float pixelYScl, float gridHeight, float margin, float x0, float y0) {
  fill(255, 0, 0);
  float xcor = x0+(x*pixelXScl);//(xcor of y-axis) + x(using the right ratio of pixels to x values)
  float ycor = y0-(y*pixelYScl);//(xcor of x-axis) + y(using the right ratio of pixels to y values)
  if (ycor>=margin && ycor<=margin+gridHeight) {
    ellipse(xcor, ycor , 0.05, 0.05);
  }
}

//void plotPoint(float x, float y) {
//  float xMin = -10;
//  float xMax = 10;
//  float xScl = 1;
//  float yMin = -10;
//  float yMax = 10;
//  float yScl = 1;
//  float pixelXScl = (width-20)/(xMax-xMin); //number of pixels to make each x on the graph increase by 1
//  float pixelYScl = ((height/2)-55)/(yMax-yMin); //number of pixels to make each y on the graph increase by 1
//  fill(255, 0, 0);
//  float xcor = 10+abs(xMin)*pixelXScl+(x*pixelXScl);//(xcor of y-axis) + x(using the right ratio of pixels to x values)
//  float ycor = 10+yMax*pixelYScl-(y*pixelYScl);//(xcor of x-axis) + y(using the right ratio of pixels to y values)
//  if (ycor>=10 && ycor<=(height/2)-45) {
//    ellipse(xcor, ycor , 0.05, 0.05);
//  }
//}

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
