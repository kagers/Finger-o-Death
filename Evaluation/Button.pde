class Button{
 float xcor, ycor, xSpan, ySpan; 
 String name;
 
 Button(float x, float y, float xS, float yS, String n){
   xcor = x;
   ycor = y;
   xSpan = xS;
   ySpan = yS;
   name = n;
 }
 
 Button(float x, float y, String name){
  this(x,y,75,25,name); 
 }
 
 void draw(){
   fill(150);
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
