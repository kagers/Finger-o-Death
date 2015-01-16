class Button{
 float xcor, ycor, xSpan, ySpan; 
 String name, sec, alph;
 int col;
 
 Button(float x, float y, float xS, float yS, String n, String s, String a, int c){
   xcor = x;
   ycor = y;
   xSpan = xS;
   ySpan = yS;
   name = n;
   sec = s;
   alph = a;
   col = c;
 }
 
 Button(float x, float y, String n, String s, String a){
  this(x,y,width/5,height/20,n,s,a,125); 
 }
 
 void draw(){
   fill(col);
   rect(xcor, ycor, xSpan, ySpan,12,12,12,12);
   fill(0);
   textAlign(CENTER,CENTER);
   textSize(12);
   text(name,xcor+(xSpan/2),ycor+(ySpan/2));
   fill(0,0,255);
   textSize(8);
   textAlign(LEFT,CENTER);
   text(sec,xcor+xSpan/8,ycor+(ySpan/4));
   fill(0,255,0);
   textAlign(RIGHT,CENTER);
   text(alph,xcor+7*xSpan/8,ycor+(ySpan/4));
   textSize(12);
   textAlign(LEFT,BOTTOM);
 }


 boolean isClicked(){
  return (mouseX>xcor && mouseX<xcor+xSpan && mouseY>ycor && mouseY<ycor+ySpan);
 }
}
