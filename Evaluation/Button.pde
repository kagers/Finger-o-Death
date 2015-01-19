class Button {
  float xcor, ycor, xSpan, ySpan; 
  String name, sec, alph;
  int col, colA, colB;
  boolean grey;

  Button(float x, float y, float xS, float yS, String n, String s, String a, int c, int cA, int cB, boolean g) {
    xcor = x;
    ycor = y;
    xSpan = xS;
    ySpan = yS;
    name = n;
    sec = s;
    alph = a;
    col = c;
    colA = cA;
    colB = cB;
    grey = g;
  }

  Button(float x, float y, float xS, float yS, String n, String s, String a, int c) {
    this(x, y, xS, yS, n, s, a, c, 0, 0, true);
  }

  Button(float x, float y, String n, String s, String a) {
    this(x, y, width/5, height/20, n, s, a, 125, 0, 0, true);
  }

  Button(float x, float y, String n, String s, String a, int c, int cA, int cB) {
    this(x, y, width/5, height/20, n, s, a, c, cA, cB, false);
  }

  void draw() {
    if (grey) {
      fill(col);
    } else {
      fill(col, colA, colB);
    }
    rect(xcor, ycor, xSpan, ySpan, 12, 12, 12, 12);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(12);
    text(name, xcor+(xSpan/2), ycor+(ySpan/2));
    fill(0, 0, 255);
    textSize(8);
    textAlign(LEFT, CENTER);
    text(sec, xcor+xSpan/8, ycor+(ySpan/4));
    fill(0, 255, 0);
    textAlign(RIGHT, CENTER);
    text(alph, xcor+7*xSpan/8, ycor+(ySpan/4));
    textSize(12);
    textAlign(LEFT, BOTTOM);
  }


  boolean isClicked() {
    return (mouseX>xcor && mouseX<xcor+xSpan && mouseY>ycor && mouseY<ycor+ySpan);
  }
}

