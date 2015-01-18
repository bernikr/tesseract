//Rotation  eines 4D Punktes
point4d rotatePoint4d(point4d x, float phi) {
  //Definition der Rotationsmatrix
  float[][] rotmat = {
    {
      1, 0, 0, 0
    }
    , 
    {
      0, 1, 0, 0
    }
    , 
    {
      0, 0, cosinus(phi), -sinus(phi)
      }
      , 
    {
      0, 0, sinus(phi), cosinus(phi)
      }
    };

  float[] p = {
    x.a1, x.a2, x.a3, x.a4
  }; //Umwandeln der Koordinaten in ein Array
  float[] np = {
    0, 0, 0, 0
  };  //Definition des Arrays der Ausgabekoordinaten

  //Multiplikation der Matrix mit dem Punkt
  for (int i=0; i < 4; i++) {
    for (int j=0; j < 4; j++) {    
      np[i] += rotmat[i][j] * p[j];
    }
  }
  return new point4d(np[0], np[1], np[2], np[3]);
}

//Klasse zur einfacheren Verwendung von 3D Punkte
class point3d {
  public float x, y, z;
  point3d(float b1, float b2, float b3) {
    x = b1;
    y = b2;
    z = b3;
  }
  public point3d rot(boolean asdf) {
    //Definition der Rotationsmatrix
    float rotx;
    float roty = radians(map(mouseX, -width/2, width/2, 180, -180));
    if (asdf) { 
      rotx = radians(map(mouseY, -height/2, height/2, 180, -180));
    }
    else {
      rotx = radians(map(mouseY+height/70, -height/2, height/2, 180, -180));
    }

    float[][] rotmaty = {
      {
        cosinus(roty), 0, -sinus(roty)
        }
        , 
      {
        0, 1, 0
      }
      , 
      {
        sinus(roty), 0, cosinus(roty)
        }
      };

    float[][] rotmatx = {
      {
        1, 0, 0
      }
      , 
      {
        0, cosinus(rotx), -sinus(rotx)
        }
        , 
      {
        0, sinus(rotx), cosinus(rotx)
        }
      };

    float[] p = {
      x, y, z
    }; //Umwandeln der Koordinaten in ein Array
    float[] np = {
      0, 0, 0
    };  //Definition des Arrays der Ausgabekoordinaten
    float[] nnp = {
      0, 0, 0
    };  //Definition des Arrays der Ausgabekoordinaten

    //Multiplikation der Matrix mit dem Punkt
    for (int i=0; i < 3; i++) {
      for (int j=0; j < 3; j++) {    
        np[i] += rotmatx[i][j] * p[j];
      }
    }
    for (int i=0; i < 3; i++) {
      for (int j=0; j < 3; j++) {    
        nnp[i] += rotmaty[i][j] * np[j];
      }
    }
    return(new point3d(nnp[0], nnp[1], nnp[2]));
  }
  public point2d to2d() {
    float a, b;

    //Projektion Verkürzung der Koordinaten
    a = x/pow(2, z/100);
    b = y/pow(2, z/100);

    return new point2d(a, b);
  }
}

class point2d {
  public float x, y;
  point2d(float b1, float b2) {
    x = b1;
    y = b2;
  }
}

//Klasse zur verwendung von 4D Punkten
class point4d {
  public float a1, a2, a3, a4;
  public float[] points = new float[4];
  point4d(float b1, float b2, float b3, float b4) {
    a1 = b1;
    a2 = b2;
    a3 = b3;
    a4 = b4;

    points[0] = b1;
    points[1] = b2;
    points[2] = b3;
    points[3] = b4;
  }

  //Funktion zur Projektion in den 3D Raum
  public point3d to3d() {
    float x, y, z;

    //Projektion Verkürzung der Koordinaten
    x = a1/pow(2, a4/100);
    y = a2/pow(2, a4/100);
    z = a3/pow(2, a4/100);

    return new point3d(x, y, z);
  }
}

class line4d {
  public point4d x, y;
  line4d(point4d a, point4d b) {
    x = a;
    y = b;
  }
}

class quad4d {
  public point4d a, b, c, d;
  quad4d(point4d q, point4d w, point4d e, point4d r) {
    a = q;
    b = w;
    c = e;
    d = r;
  }
}

