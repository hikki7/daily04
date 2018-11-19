

class Intelli {

  int norse=0;
  int east=1;
  int south=2;
  int west=3;
  float posX, posY;
  float posXcross, posYcross;
  float hue;
  int direction=(int)random(4);
  float angleCount=7;
  float dWeight=50;
  float stepSize=5;
  float angle;
  float distance;

  Intelli(float _hue, float x, float y) {
    hue=_hue;
    posX=x;
    posY=y;
    posXcross=posX;
    posYcross=posY;
    angle=getRandomAngle(direction);
  }

  void draw() {

    strokeWeight(1);
    stroke(255);
    point(posX, posY);
    posX+=cos(radians(angle))*stepSize;
    posY+=sin(radians(angle))*stepSize;

    boolean reachBorder=false;

    if (posY<=stepSize) {
      reachBorder=true;
      direction=south;
      posY=stepSize;
      posX+=random(-2,2);
    }
    if (posX>=width-stepSize) {
      reachBorder=true;
      direction=west;
      posX=width-stepSize;
      posY+=random(-2,2);
    }
    if (posY>=height-stepSize) {
      reachBorder=true;
      direction=norse;
      posY=height-stepSize;
      posX+=random(-2,2);
    }
    if (posX<=stepSize) {
      reachBorder=true;
      direction=east;
      posX=stepSize;
      posY=random(-2,2);
    }

    int px=(int)posX;
    int py=(int)posY;
    if (get(px, py)==color(255)||reachBorder) {
      angle=getRandomAngle(direction);
      distance=dist(posX, posY, posXcross, posYcross);
      strokeWeight(distance/dWeight);
      stroke(hue, 80, 80, 100);
      line(posX, posY, posXcross, posYcross);
      posXcross=posX;
      posYcross=posY;
    }
  }


  float getRandomAngle(int dir) {

    float a = (floor(random(-angleCount, angleCount)) + 0.5) * 90.0/angleCount;

    if (dir==norse) {
      return(90-a);
    }
    if (dir==east) {
      return a;
    }
    if (dir==south) {
      return a+90;
    }
    if (dir==west) {
      return a+180;
    }
    return 0;
  }
}
