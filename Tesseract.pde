data.alpha = 0;        //Winkel der Rotation in R4
data.active = true;  //Status der Drehung
data.speed = 1;       //Rotationsgeschwindigkeit
data.scale = 70;
data.rotation = {};

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);

  //Zeichnen der Flächen
  for (int i = 0; i < data.cube.faces.length; i++) {
    var face  = data.cube.faces[i];

    //Rotation der Punkte
    p1 = face[0].rotate(radians(data.alpha));
    p2 = face[1].rotate(radians(data.alpha));
    p3 = face[2].rotate(radians(data.alpha));
    p4 = face[3].rotate(radians(data.alpha));

    //Zeichen der Fläche
    stroke(0);
    fill(255, 0, 0, 50);

    //Zeichnen der Seitenfläche
    beginShape();
    vertex(p1.to3d().rot().to2d()[0]*data.scale, p1.to3d().rot().to2d()[1]*data.scale);
    vertex(p2.to3d().rot().to2d()[0]*data.scale, p2.to3d().rot().to2d()[1]*data.scale);
    vertex(p3.to3d().rot().to2d()[0]*data.scale, p3.to3d().rot().to2d()[1]*data.scale);
    vertex(p4.to3d().rot().to2d()[0]*data.scale, p4.to3d().rot().to2d()[1]*data.scale);
    endShape(CLOSE);
  }

  //Zeichnen des Netzes
  for (int i = 0; i < data.cube.edges.length; i++) {
    //Rotation der Punkte
    p1 = data.cube.edges[i][0].rotate(radians(data.alpha));
    p2 = data.cube.edges[i][1].rotate(radians(data.alpha));

    //Zeichnen der Liene
    line(p1.to3d().rot().to2d()[0]*data.scale, p1.to3d().rot().to2d()[1]*data.scale, p2.to3d().rot().to2d()[0]*data.scale, p2.to3d().rot().to2d()[1]*data.scale);
  }
  popMatrix();
  //Erhöhung von Rotationswinkel alpha
  if (data.active) {
    data.alpha += data.speed;
    data.alpha = data.alpha%360;
  }

  // get mouse pos
  data.rotation.y = radians(map(mouseX, -width/2, width/2, 180, -180));
  data.rotation.x = radians(map(mouseY, -height/2, height/2, 180, -180));
}
