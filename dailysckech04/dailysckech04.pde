

Intelli intelli1,intelli2;

void setup(){
   
  fullScreen(P2D);
  //size(400,400);
  background(0);
  smooth();
  blendMode(ADD);
  colorMode(HSB,360,100,100,100);
  noCursor();
  
  intelli1=new Intelli(210,width/4,height/2);
  intelli2=new Intelli(30,width*3/4,height/2);
}

void draw(){
  println("posX="+intelli1.posX+" posY="+intelli1.posY);
  intelli1.draw();
  intelli2.draw();
}
