//Rotation  eines 4D Punktes
point4d rotatePoint4d(point4d x, float phi){
  //Definition der Rotationsmatrix
  float[][] rotmat = {{1,0,0,0},
                      {0,1,0,0},
                      {0,0,cosinus(phi),-sinus(phi)},
                      {0,0,sinus(phi),cosinus(phi)}};
                      
  float[] p = {x.a1,x.a2,x.a3,x.a4}; //Umwandeln der Koordinaten in ein Array
  float[] np = {0,0,0,0};  //Definition des Arrays der Ausgabekoordinaten
  
  //Multiplikation der Matrix mit dem Punkt
  for (int i=0; i < 4; i++) {
   for (int j=0; j < 4; j++) {    
     np[i] += rotmat[i][j] * p[j];
   }
  }
  return new point4d(int(np[0]),int(np[1]),int(np[2]),int(np[3]));
}

//Klasse zur einfacheren Verwendung von 3D Punkte
class point3d{
  public int x, y, z;
  point3d(int b1, int b2, int b3){
    x = b1;
    y = b2;
    z = b3;
  }
}

//Klasse zur verwendung von 4D Punkten
class point4d{
  public float a1, a2, a3, a4;
  point4d(int b1, int b2, int b3, int b4){
    a1 = b1;
    a2 = b2;
    a3 = b3;
    a4 = b4;
  }
  
  //Funktion zur Projektion in den 3D Raum
  public point3d to3d(){
    float x, y, z;
    
    //Projektion Verkürzung der Koordinaten
    x = a1/pow(2,a4/100);
    y = a2/pow(2,a4/100);
    z = a3/pow(2,a4/100);
    
    return new point3d(int(x),int(y),int(z));
  }
}

class line4d{
  public point4d x,y;
  line4d(point4d a, point4d b){
    x = a;
    y = b;
  }
}
