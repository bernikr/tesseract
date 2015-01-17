int x = 100;            //Abstand der Punkte des Tesserates auf die Ebenen
int orbitradius = 400;  //Abstand der Kamera vom Koordinatenursprung in R3
float alpha = 0;        //Winkel der Rotation in R4
boolean active = true;  //Status der Drehung
float dalpha = 1;

void setup(){
  size(400,400,P3D);
}

void draw(){
  background(255);
  
  //Rotation der Kamera um den Ursprung in R3 (c)Julius Piso
  beginCamera();
  camera();
  translate(width/2, height/2, -orbitradius);
  float rotz = radians(map(mouseX, -width/2, width/2, 180, -180));
  rotateY(rotz);
  float rotx = radians(map(mouseY, -height/2, height/2, 180, -180));
  rotateX(rotx);
  endCamera();
  //Ende der Rotation
  
  //Zeichnen der Linien
  for(int i = 0; i < Kanten.length; i++){
    line4d Kante = Kanten[i];
    
    //Rotation der beiden Punkte 
    point4d p1 = rotatePoint4d(Kante.x, radians(alpha));
    point4d p2 = rotatePoint4d(Kante.y, radians(alpha));
    
    line(p1.to3d().x,p1.to3d().y,p1.to3d().z,p2.to3d().x,p2.to3d().y,p2.to3d().z); //Zeichnen der Linie in R3
  }
  
  //Erhöhung von Rotationswinkel alpha
  if(active){
    alpha += dalpha;
    alpha = alpha%360;
  }
}

void keyPressed() {
  if(key == ' '||key == ENTER){
    active = !active;
  }else if(key == 'w'){
    dalpha *= 2;
  }else if(key == 's'){
    dalpha *= 0.5;
  }
   println(dalpha);
}
