//Funktion zur Berrechnung des Sinus mithilfe der Taylor-Reihen, da die normale Funktion zu ungenau war.
float sinus(float phi){
  //normierung auf den Breich 0-2Pi
  phi = phi%(2*PI);
  
  //Berechnung
  float s = 0;
  for(int i =0;i < 20;i++){
    s += pow(-1,i)*pow(phi,2*i+1)/fact(2*i+1);
  }
  return s;
}

//Funktion des Cosinus
float cosinus(float phi){
  return sinus(phi+90);
}

//Faktorielle
double fact(int n){
 if (n <= 1) {
   return 1;
 }
 else {
   return n * fact(n-1);
 }
}
