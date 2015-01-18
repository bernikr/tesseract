int x = 70;            //Abstand der Punkte des Tesserates auf die Ebenen
float alpha = 0;        //Winkel der Rotation in R4
boolean active = true;  //Status der Drehung
float dalpha = 1;

void setup() {
  size(displayWidth, displayHeight);
  smooth();
  frameRate(50);
}

boolean sketchFullScreen() {
  return true;
}

void draw() {
  background(255);
  noCursor();

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

  //Erhöhung von Rotationswinkel alpha
  if (active) {
    alpha += dalpha;
    alpha = alpha%360;
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

