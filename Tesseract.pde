int x = 50;             //Abstand der Punkte des Tesserates auf die Ebenen
float alpha = 0;        //Winkel der Rotation in R4
boolean active = true;  //Status der Drehung
float dalpha = 1;       //Rotationsgeschwindigkeit

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  //Zeichnen der Flächen
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
    
    //Zeichnen der Seitenfläche
    beginShape();
    vertex(p1.to3d().rot().to2d().x, p1.to3d().rot().to2d().y);
    vertex(p2.to3d().rot().to2d().x, p2.to3d().rot().to2d().y);
    vertex(p3.to3d().rot().to2d().x, p3.to3d().rot().to2d().y);
    vertex(p4.to3d().rot().to2d().x, p4.to3d().rot().to2d().y);
    endShape(CLOSE);
  }
  
  //Zeichnen des Netzes
  for (int i = 0; i < Kanten.length; i++) {
    //Rotation der Punkte
    point4d p1 = rotatePoint4d(Kanten[i].x, radians(alpha));
    point4d p2 = rotatePoint4d(Kanten[i].y, radians(alpha));

    //Zeichnen der Liene
    line(p1.to3d().rot().to2d().x, p1.to3d().rot().to2d().y, p2.to3d().rot().to2d().x, p2.to3d().rot().to2d().y);
  }
  popMatrix();
  //Erhöhung von Rotationswinkel alpha
  if (active) {
    alpha += dalpha;
    alpha = alpha%360;
  }
}

//Tastenbelegungen
void keyPressed() {
  //Enter, " ": Pause
  if (key == ' '||key == ENTER) {
    active = !active;
  }
  //W: speed up
  else if (key == 'w') {
    dalpha *= 2;
  }
  //S: speed down
  else if (key == 's') {
    dalpha *= 0.5;
  }
}
