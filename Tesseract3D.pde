int x = 70;            //Abstand der Punkte des Tesserates auf die Ebenen
float alpha = 0;        //Winkel der Rotation in R4
boolean active = true;  //Status der Drehung
float dalpha = 1;
PFont loltext;
PImage doge;
int dogex = 0;
int doged = 1;


void setup() {
  size(displayWidth, displayHeight);
  loltext = loadFont("ComicSans.vlw");
  smooth();
  doge = loadImage("doge.gif");
  frameRate(50);
}

boolean sketchFullScreen() {
  return true;
}

void draw() {
  background(255);
  noCursor();
  textAlign(CENTER, CENTER);  
  textFont(loltext, height/14);

  fill(random(255), random(255), random(255));
  text("wow", width/4+height/7, height/5);  
  text("wow", width/4*3+height/7*1.1, height/5);

  fill(0, 0, 255);
  text("so cool", width/2-height/7*1.5, height/2-height/14);  
  text("so cool", width-height/7*1.5+height/28, height/2-height/14 );


  pushMatrix();
  translate(width/4, height/2);

  for (int i = 0; i < Flachen.length; i++) {
    quad4d seite = Flachen[i];

    //Rotation der Punkte 
    point4d p1 = rotatePoint4d(seite.a, radians(alpha));
    point4d p2 = rotatePoint4d(seite.b, radians(alpha));
    point4d p3 = rotatePoint4d(seite.c, radians(alpha));
    point4d p4 = rotatePoint4d(seite.d, radians(alpha));

    //Zeichen der Fläche
    stroke(0);
    fill(255, 0, 0, 50);
    //fill(random(255),random(255),random(255),100);
    beginShape();
    vertex(p1.to3d().rot(false).to2d().x/2, p1.to3d().rot(false).to2d().y);
    vertex(p2.to3d().rot(false).to2d().x/2, p2.to3d().rot(false).to2d().y);
    vertex(p3.to3d().rot(false).to2d().x/2, p3.to3d().rot(false).to2d().y);
    vertex(p4.to3d().rot(false).to2d().x/2, p4.to3d().rot(false).to2d().y);
    endShape(CLOSE);
  }

  for (int i = 0; i < Kanten.length; i++) {
    point4d p1 = rotatePoint4d(Kanten[i].x, radians(alpha));
    point4d p2 = rotatePoint4d(Kanten[i].y, radians(alpha));

    line(p1.to3d().rot(false).to2d().x/2, p1.to3d().rot(false).to2d().y, p2.to3d().rot(false).to2d().x/2, p2.to3d().rot(false).to2d().y);
  }

  translate(width/2, 0);

  for (int i = 0; i < Flachen.length; i++) {
    quad4d seite = Flachen[i];

    //Rotation der Punkte 
    point4d p1 = rotatePoint4d(seite.a, radians(alpha));
    point4d p2 = rotatePoint4d(seite.b, radians(alpha));
    point4d p3 = rotatePoint4d(seite.c, radians(alpha));
    point4d p4 = rotatePoint4d(seite.d, radians(alpha));

    //Zeichen der Fläche


    stroke(0);
    fill(255, 0, 0, 50);
    //fill(random(255),random(255),random(255),100);
    beginShape();
    vertex(p1.to3d().rot(true).to2d().x/2, p1.to3d().rot(true).to2d().y);
    vertex(p2.to3d().rot(true).to2d().x/2, p2.to3d().rot(true).to2d().y);
    vertex(p3.to3d().rot(true).to2d().x/2, p3.to3d().rot(true).to2d().y);
    vertex(p4.to3d().rot(true).to2d().x/2, p4.to3d().rot(true).to2d().y);
    endShape(CLOSE);
  }

  for (int i = 0; i < Kanten.length; i++) {
    point4d p1 = rotatePoint4d(Kanten[i].x, radians(alpha));
    point4d p2 = rotatePoint4d(Kanten[i].y, radians(alpha));

    line(p1.to3d().rot(true).to2d().x/2, p1.to3d().rot(true).to2d().y, p2.to3d().rot(true).to2d().x/2, p2.to3d().rot(true).to2d().y);
  }
  popMatrix();

  fill(255, 0, 0);
  text("very 3d", height/7, height/2+height/10 );  
  text("very 3d", height/7+width/2-height/70*0.2, height/2+height/10);

  fill(0, 255, 0);
  text("much realism", width/2-height/7*2, height-height/10);
  text("much realism", width-height/7*2-height/100, height-height/10);

  image(doge, height/14, height/14, height/7-dogex/4, height/7*2-dogex/2);
  image(doge, width/2+height/14+dogex, height/14, height/7-dogex/4, height/7*2-dogex/2);
  //Erhöhung von Rotationswinkel alpha
  if (active) {
    alpha += dalpha;
    alpha = alpha%360;
    dogex += doged ;

    if (dogex > height/70*1.5 || dogex < -height/70*1.5) {
      doged *= -1;
    }
  }
}

void keyPressed() {
  if (key == ' '||key == ENTER) {
    active = !active;
  }
  else if (key == 'w') {
    dalpha *= 2;
  }
  else if (key == 's') {
    dalpha *= 0.5;
  }
}

