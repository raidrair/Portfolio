//built by Caden Miller
//calculator
class CalcButton {
  //class variables
  boolean isNumber;
  boolean isSpecial;
  boolean isOperator;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int buttonW = 20;
  int buttonH = 20;
  boolean overBox = false;

  //constructor
  CalcButton(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    //println(numButtonValue);
  }

  CalcButton asNumber (float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  CalcButton asOperator (String tempOpButtonValue, int tempW, int tempH) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  CalcButton asSpecial (String buttonValue, int tempW, int tempH) {
    isSpecial = true;
    spButtonValue= buttonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }

  //draw the button on the canvas
  void display () {
    //draw rounded edges on the vanvas
    if (isNumber) {
      fill(177);
      stroke(8);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH);
      fill(122, 44, 22);
      textSize(14);
      text(int(numButtonValue), xpos+5, ypos+15);
    } else if (isSpecial) {
      fill(177);
      stroke(8);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH);
      fill(122, 44, 22);
      textSize(14);
      text (spButtonValue, xpos+5, ypos+15);
    } else if (isOperator)  {
      fill(177);
      stroke(8);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH);
      fill(122, 44, 22);
      textSize(14);
      text(opButtonValue , xpos+5, ypos+15);
    }
  }

  //handle mouse actions
  void click() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}

