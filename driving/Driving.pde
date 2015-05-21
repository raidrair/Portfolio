Car[] myCars = new Car[15];


void setup () {
  size (500, 500);
  background (255);
  frameRate (20);
 //intantiate the array of cars
 for (int i=0; i< myCars.length; i++) {
   myCars [i] = new Car(random(width), random(height) , int (random (15)), color ( random (255), random (255), random (255)), random (10));
 }
 
  
}

void draw () {
  background(255);
  
  for (int i = 0; i< myCars.length; i++) {
    Car iCar = myCars[i];
    iCar.display();
    iCar.drive();
  }
}


class Car {
  //member variables
  int cLength, cHeight, cWidth, cSpeed;
  float xpos, ypos;
  color cColor;
  float left;

  //constructor 1
  Car(float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = 5;
    cColor = color (0, 0, 255);
  }

  //constructor 2
  Car(float tempX, float tempY, int tempSpeed, color tempColor, float tempLeft) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = tempLeft;
  }


  //membor methods
  void display () {
    rectMode(CENTER);
    fill(cColor);
    rect(xpos, ypos, 20, 10);
    
    //overhead view details
    fill (255);
    rect(xpos-2, ypos, 8,6);
    rect(xpos+6, ypos+7,5,3);
    rect(xpos-6, ypos+7,5,3);
    rect(xpos+6, ypos-6, 5,3);
    rect(xpos-6, ypos-6,5,3);
  }

  void drive () {
    if (left<=5) {
      xpos= xpos + cSpeed;
      if (xpos > width) {
        xpos=0;
      }
    } else {
      xpos= xpos - cSpeed;
    }
    if (xpos < 0) {
      xpos=width;
    }
  }
}



