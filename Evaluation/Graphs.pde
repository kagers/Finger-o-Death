class Graphs {
  //gotten from Window
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


  Graphs() {
    xMin = (float)evaluateParens(windowInput.get(0));
    xMax = (float)evaluateParens(windowInput.get(1));
    xScl = (float)evaluateParens(windowInput.get(2));
    yMin = (float)evaluateParens(windowInput.get(3));
    yMax = (float)evaluateParens(windowInput.get(4));
    yScl = (float)evaluateParens(windowInput.get(5));
    pixelXScl = (width-20)/(xMax-xMin); //number of pixels to make each x on the graph increase by 1
    pixelYScl = ((height/2)-55)/(yMax-yMin); //number of pixels to make each y on the graph increase by 1
    x0 = 10-xMin*pixelXScl; //xcor of y-axis; where x=0;
    y0 = 10+yMax*pixelYScl; //ycor of x-axis; where y=0;
    gridWidth = width-20;
    gridHeight = (height/2)-55;
    margin = 10;
    background(255);
  }

  void draw() {
    xMin = (float)evaluateParens(windowInput.get(0));
    xMax = (float)evaluateParens(windowInput.get(1));
    xScl = (float)evaluateParens(windowInput.get(2));
    yMin = (float)evaluateParens(windowInput.get(3));
    yMax = (float)evaluateParens(windowInput.get(4));
    yScl = (float)evaluateParens(windowInput.get(5));
    pixelXScl = (width-20)/(xMax-xMin); //number of pixels to make each x on the graph increase by 1
    pixelYScl = ((height/2)-55)/(yMax-yMin); //number of pixels to make each y on the graph increase by 1
    x0 = 10-xMin*pixelXScl; //xcor of y-axis; where x=0;
    y0 = 10+yMax*pixelYScl; //ycor of x-axis; where y=0;
    gridWidth = width-20;
    gridHeight = (height/2)-55;
    margin = 10;

    grid();
    graph(graphInput);
  }

  void grid() {
    for (float xcor=margin; xcor<=margin+gridWidth; xcor+=pixelXScl*xScl) {//vertical lines
      stroke(180);
      line(xcor, margin, xcor, gridHeight+margin);
    }
    for (float ycor=margin; ycor<=gridHeight+margin; ycor+=pixelYScl*yScl) {//horizontal lines
      stroke(180);
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

  void graph(ArrayList<ArrayList<String>> functions) {//graphs all functions inputted into the Y= screen  
    for (int k=0; k<functions.size (); k++) {
      for(int el=0; el<functions.get(k).size(); el++){
       if (functions.get(k).get(el).equals("X") && el!=0 && functions.get(k).get(el-1).matches("[0-9]+")){
         functions.get(k).add(el,"*");
       }
      }
      ArrayList<String> plugged = new ArrayList<String>();
      if (functions.get(k).size()!=0) {
        //finds all y values for all x values on the graph, with a 0.01 scale
        //is this enough? Some graphs look sketchier than others. Will try connecting points and/or making scale smaller
        //for (float x=xMin; x<=xMax; x+=0.01) {
        for (float x=xMin; x<xMax; x+=0.01) {
          //System.out.println("x=:"+x);
          //System.out.println(Double.parseDouble("1.3357401E-4"));
          for (int i=0; i<functions.get (k).size(); i++) {
            if (functions.get(k).get(i).equals("X")) {//plugs in x value for every "X" in the input
              //System.out.println("plugged");
              plugged.add(""+x);
              System.out.println(plugged);
            } else {
              //System.out.println(functions.get(k).get(i));
              plugged.add(functions.get(k).get(i));
            }
          }
          //System.out.println(plugged);
          plotPoint((float)x, (float)evaluateParens(plugged));//plots the point
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
}
