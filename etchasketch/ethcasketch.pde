int x, y;

void setup() {
  size(700, 700);
  frameRate(10);
  // Set start coords
  x = 0;
  y = 0;
  background(255);
}

void draw() {
  
  strokeWeight(2);
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      moveDiagDownLeft(1);
    } else if (key == 's' || key == 'S') {      
      moveDown(1);
    } else if (key == 'C' || key == 'c') {      
      moveDiagDownRight(1);
    } else if (key == 'a' || key == 'A') {      
      moveLeft(1);
    } else if (key == 'D' || key == 'd') {      
      moveRight(1);
    } else if (key == 'q' || key == 'Q') {      
      moveDiagUpLeft(1);
    } else if (key == 'w' || key == 'W') {      
      moveUp(1);
    } else if (key == 'e' || key == 'E') {      
      moveDiagUpRight(1);
    } else if (key == 'g' || key == 'G') {      
      clearscreen();
    }
  }
}





// Algorithm for your first name
void drawName() {
}


// Method to draw right line
void moveRight(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y);
  }
  x=x+(10*rep);
}


//draw left line
void moveLeft(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y);
  }
  x=x-(10*rep);
}


void moveUp(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y-i);
  }
  y=y-(10*rep);
}


void moveDown(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y+i);
  }
  y=y+(10*rep);
}


void moveDiagUpLeft(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y-i);
  }
  x=x-(10*rep);
  y=y-(10*rep);
}


void moveDiagUpRight(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y-i);
  }
  x=x+(10*rep);
  y=y-(10*rep);
}


void moveDiagDownRight(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y+i);
  }
  x=x+(10*rep);
  y=y+(10*rep);
}


void moveDiagDownLeft(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y+i);
  }
  x=x-(10*rep);
  y=y+(10*rep);
}

void clearscreen() {
  background (255);
  x=0;
  y=0;
}

void mouseClicked() {
  saveFrame("line-######.png");
}


