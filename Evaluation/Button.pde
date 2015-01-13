class Button{
 float xcor, ycor, xSpan, ySpan; 
 String name;
 int col;
 
 Button(float x, float y, float xS, float yS, String n, int c){
   xcor = x;
   ycor = y;
   xSpan = xS;
   ySpan = yS;
   name = n;
   col = c;
 }
 
 Button(float x, float y, String name){
  this(x,y,width/5,height/20,name,150); 
 }
 
 void draw(){
   fill(col);
   rect(xcor, ycor, xSpan, ySpan);
   fill(0);
   textAlign(CENTER,CENTER);
   text(name,xcor+(xSpan/2),ycor+(ySpan/2));
   textAlign(LEFT,BOTTOM);
 }


 boolean isClicked(){
  return (mouseX>xcor && mouseX<xcor+xSpan && mouseY>ycor && mouseY<ycor+ySpan);
 }
}
