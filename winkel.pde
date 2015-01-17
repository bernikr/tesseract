float sinus(float phi){
  //return sin(phi);
  phi = phi%(2*PI);
  
  float s = 0;
  for(int i =0;i < 20;i++){
    s += pow(-1,i)*pow(phi,2*i+1)/fact(2*i+1);
  }
  return s;
}

float cosinus(float phi){
  return sinus(phi+90);
}

double fact(int n){
 if (n <= 1) {
   return 1;
 }
 else {
   return n * fact(n-1);
 }
}
