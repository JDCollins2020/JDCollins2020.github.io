/* @pjs preload="myPlant_002.jpg "; */
//GLOBALS
HScrollbar hs1;              //user interactive
HScrollbar hs2;
HScrollbar hs3;
PImage img;                  //background image
float theta;
float x;
float y;
float px;
float py;
float radius;
float ratio;
float rIncre;

//initalize
void setup(){
  size(600,600);
  //intialize objects
  hs1 = new HScrollbar(0, height - 56, width, 16, 1);
  hs2 = new HScrollbar(0, height - 36, width, 16, 1);
  hs3 = new HScrollbar(0, height-16, width, 16, 1);
  img = loadImage("myPlant_002.jpg");
}

//run
void draw(){
  tint(255,255,255,75);            //tint(R,G,B,Opacity)
  image(img,0,0,width,height);     //image(PImage,x,y,width,height);
  /*plot point*/
  pushMatrix();
   translate(282,295);             //center of plant
   rotate(map(hs3.getPos(),0,width,0,2*PI));
   px = 0;
   py = 0;
   theta = 0;
   ratio = map(hs1.getPos(),0,width,.3333333,2.000 );
   rIncre = map(hs2.getPos(),0,width,1,100);
   ratio = ratio*(2*PI);
   for(radius = 1; radius < 255; radius+=rIncre){
     x = radius * cos(theta);
     y = radius * sin(theta);
     stroke(radius,255-radius,200);
     strokeWeight(7);
     point(x,y);
     strokeWeight(1);
     line(x,y,0,0);
     stroke(25,25,155,50);
     line(x,y,px,py);
     px = x;
     py = y;
     theta = theta - ratio; //counter clockwise
   }
  popMatrix();
  hs1.update();
  hs1.display();
  hs2.update();
  hs2.display();
  hs3.update();
  hs3.display();
  textSize(12);
  fill(255);
  text(ratio/(2*PI),20,80);
}
void keyPressed()
{
  if(keyCode==ENTER)
  {
    save("Mart_001"+".pdf");
  }
}

/* from https://processing.org/examples/scrollbar.html
 * didn't see a point in reinventing the wheel
 */

class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204,100);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102,100);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
