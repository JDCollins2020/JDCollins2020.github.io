int x;
int y;
int r;
float theta;
void setup(){
size(600,600);
r = 100;
theta = 0;
}
void draw()
{
  x = (int)( r*cos(theta))+300;
  y = (int)(r*sin(theta))+300;
  background(0);
  stroke(102);
  line(0,height/2, width, height/2);
  noStroke();
  fill(0,255,150,104);
  int d = y/2+10;
  ellipse(x,height/2, d, d);
  fill(255,255,0,104);
  int iX = width-x;
  int iY = height-y;
  int iD = (iY/2+10);
  ellipse(iX,height/2, iD, iD);
  theta = theta + radians(1);
}
