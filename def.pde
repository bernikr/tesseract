//Array der Ecken des Tesseraktes in R4
point4d[] Ecken = {
  new point4d(x, x, x, x), 
  new point4d(x, x, x, -x), 
  new point4d(x, x, -x, x), 
  new point4d(x, x, -x, -x), 

  new point4d(x, -x, x, x), 
  new point4d(x, -x, x, -x), 
  new point4d(x, -x, -x, x), 
  new point4d(x, -x, -x, -x), 

  new point4d(-x, x, x, x), 
  new point4d(-x, x, x, -x), 
  new point4d(-x, x, -x, x), 
  new point4d(-x, x, -x, -x), 

  new point4d(-x, -x, x, x), 
  new point4d(-x, -x, x, -x), 
  new point4d(-x, -x, -x, x), 
  new point4d(-x, -x, -x, -x)
  };

  //Array der Kanten des Tesseraktes in R4
line4d[] Kanten = {
  new line4d(Ecken[0], Ecken[1]), 
  new line4d(Ecken[0], Ecken[2]), 
  new line4d(Ecken[0], Ecken[4]), 
  new line4d(Ecken[0], Ecken[8]), 

  new line4d(Ecken[1], Ecken[3]), 
  new line4d(Ecken[1], Ecken[5]), 
  new line4d(Ecken[1], Ecken[9]), 

  new line4d(Ecken[2], Ecken[3]), 
  new line4d(Ecken[2], Ecken[6]), 
  new line4d(Ecken[2], Ecken[10]), 

  new line4d(Ecken[3], Ecken[7]), 
  new line4d(Ecken[3], Ecken[11]), 

  new line4d(Ecken[4], Ecken[5]), 
  new line4d(Ecken[4], Ecken[6]), 
  new line4d(Ecken[4], Ecken[12]), 

  new line4d(Ecken[5], Ecken[7]), 
  new line4d(Ecken[5], Ecken[13]), 

  new line4d(Ecken[6], Ecken[7]), 
  new line4d(Ecken[6], Ecken[14]), 

  new line4d(Ecken[7], Ecken[15]), 

  new line4d(Ecken[8], Ecken[9]), 
  new line4d(Ecken[8], Ecken[10]), 
  new line4d(Ecken[8], Ecken[12]), 

  new line4d(Ecken[9], Ecken[11]), 
  new line4d(Ecken[9], Ecken[13]), 

  new line4d(Ecken[10], Ecken[11]), 
  new line4d(Ecken[10], Ecken[14]), 

  new line4d(Ecken[11], Ecken[15]), 

  new line4d(Ecken[12], Ecken[13]), 
  new line4d(Ecken[12], Ecken[14]), 

  new line4d(Ecken[13], Ecken[15]), 

  new line4d(Ecken[14], Ecken[15])
  };

  //Array der Flächen des Tesseraktes in R4
quad4d[] Flachen = {
  new quad4d(Ecken[0], Ecken[1], Ecken[3], Ecken[2]), 
  new quad4d(Ecken[12], Ecken[13], Ecken[15], Ecken[14]), 
  new quad4d(Ecken[4], Ecken[5], Ecken[7], Ecken[6]), 
  new quad4d(Ecken[8], Ecken[9], Ecken[11], Ecken[10]), 

  new quad4d(Ecken[10], Ecken[11], Ecken[15], Ecken[14]), 
  new quad4d(Ecken[0], Ecken[1], Ecken[5], Ecken[4]), 
  new quad4d(Ecken[2], Ecken[3], Ecken[7], Ecken[6]), 
  new quad4d(Ecken[8], Ecken[9], Ecken[13], Ecken[12]), 

  new quad4d(Ecken[9], Ecken[11], Ecken[15], Ecken[13]), 
  new quad4d(Ecken[0], Ecken[2], Ecken[6], Ecken[4]), 
  new quad4d(Ecken[1], Ecken[3], Ecken[7], Ecken[5]), 
  new quad4d(Ecken[8], Ecken[10], Ecken[14], Ecken[12]), 


  new quad4d(Ecken[6], Ecken[7], Ecken[15], Ecken[14]), 
  new quad4d(Ecken[0], Ecken[1], Ecken[9], Ecken[8]), 
  new quad4d(Ecken[2], Ecken[3], Ecken[11], Ecken[10]), 
  new quad4d(Ecken[4], Ecken[5], Ecken[13], Ecken[12]), 

  new quad4d(Ecken[5], Ecken[7], Ecken[15], Ecken[13]), 
  new quad4d(Ecken[0], Ecken[2], Ecken[10], Ecken[8]), 
  new quad4d(Ecken[1], Ecken[3], Ecken[11], Ecken[9]), 
  new quad4d(Ecken[4], Ecken[6], Ecken[14], Ecken[12]), 

  new quad4d(Ecken[3], Ecken[7], Ecken[15], Ecken[11]), 
  new quad4d(Ecken[0], Ecken[4], Ecken[12], Ecken[8]), 
  new quad4d(Ecken[1], Ecken[5], Ecken[13], Ecken[9]), 
  new quad4d(Ecken[2], Ecken[6], Ecken[14], Ecken[10])
  };

