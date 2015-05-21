void setup() {
  size (400,400);
  background(255);
  frameRate(1);
}

void draw() {
  background(255);
  //head outline
  strokeWeight(6);
  fill(random(220,250),random(200,255),random(10,18));
  ellipse(width/2,height/2,random(300,400),random(300,400));
  //face
  //eyes
  strokeWeight(4);
  fill(255);
  //eye left
  ellipse(width/3, height/3.5,random(20,60),random(20,60));
  //eye right
  ellipse(width/1.5,height/3.5,random(20,60),random(20,60));
  //nose line 1
  fill(0);
  line(random(150,230),random(150,170),255,215);
  //nose line 2
  line(255,215,random(180,210),random(195,225));
  //mouth
  line(random(100,150),random(250,285),random(250,300),random(250,285));
}

