//Built by Caden Miller
CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[6];
CalcButton[] spButtons = new CalcButton[1];

String displayValue = "0";
String valueToCompute = ""; //string value left of operator
String valueToCompute2 = ""; //string value right of operator
float valueToComputeI = 0; //float value left of the operator
float valueToComputeII = 0; //float value right of operator
float result = 0;
char opValue;
boolean firstNum;

void setup () { 
  size (150, 210);
  background (56, 60, 232);
  noFill();
  strokeWeight (2);
  stroke(100);
  rect(1, 1, 150, 210);

  //populate number buttons
  numButtons[0] = new CalcButton (60, 180).asNumber(0, 20, 20);
  numButtons[1] = new CalcButton (30, 150).asNumber(1, 20, 20);
  numButtons[2] = new CalcButton (60, 150).asNumber(2, 20, 20);
  numButtons[3] = new CalcButton (90, 150).asNumber(3, 20, 20);
  numButtons[4] = new CalcButton (30, 120).asNumber(4, 20, 20);
  numButtons[5] = new CalcButton (60, 120).asNumber(5, 20, 20); 
  numButtons[6] = new CalcButton (90, 120).asNumber(6, 20, 20); 
  numButtons[7] = new CalcButton (30, 90).asNumber(7, 20, 20); 
  numButtons[8] = new CalcButton (60, 90).asNumber(8, 20, 20);
  numButtons[9] = new CalcButton (90, 90).asNumber(9, 20, 20);
  opButtons[0] = new CalcButton (60, 60).asOperator("+", 20, 20);
  opButtons[1] = new CalcButton (30, 60).asOperator("-", 20, 20);
  opButtons[2] = new CalcButton (120, 60).asOperator("/", 20, 20);
  opButtons[3] = new CalcButton (90, 60).asOperator("*", 20, 20);
  opButtons[4] = new CalcButton (90, 180).asOperator("=", 50, 20);
  spButtons[0] = new CalcButton (120, 150).asSpecial(".", 20, 20);
  opButtons[5] = new CalcButton (30, 180).asOperator("C", 20, 20);
  //  isSpecial[1] = new CalcButton (50, 70).isSpecial("=", 20, 20);
  //set the intial value of first num to true
  firstNum = true;
}

void draw () {
  //draw number buttons
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.display();
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    CalcButton ispButtons = spButtons[i];
    ispButtons.display();
  }
  updateDisplay();
}

void mousePressed () {
  for (int i=0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.overBox) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int (inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iOpButton = opButtons[i];
    iOpButton.click();
    if (iOpButton.overBox)
      if (iOpButton.opButtonValue == "+") {
        if (result !=0) {
          opValue='+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "-") {
        if (result !=0) {
          opValue='-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else  if (iOpButton.opButtonValue == "*") {
        if (result !=0) {
          opValue='*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else  if (iOpButton.opButtonValue == "/") {
        if (result !=0) {
          opValue='/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "C") {
          displayValue = "0";
          opValue = 'C';
          valueToCompute = "";
          valueToCompute2 = "";
          valueToComputeI= 0;
          valueToComputeI= 0;
          result = 0;
          firstNum = true;
      }
      
      
      else if (iOpButton.opButtonValue == "=") {
        //perform calculation
        firstNum = true;
        performCalculation();
      }/* else if (iOpButton.opButtonValue == "=") {
       if (result != 0) {
       opValue = '-';
       valueToCompute2 = "";
       firstNum = false;
       displayValue = "-";
       } else {
       opValue = '-';
       firstNum = false;
       displayValue = "-";
       }
       } 
             else if (iOpButton.opButtonValue == "C") {
               displayValue = "0";
               opValue ="C";
               valueToCompute = "";
               valueToCompute2 = "";
               valueToComputeI= 0;
               valueToComputeI= 0;
               result = 0;
               firstNum = true;
       //      } else if (iOpButton.opButtonValue == "+/-") {
       if (firstNum) {
       valueToComputeII = valueToComputeI*-1;
       displayValue = str(valueToComputeI);
       }*/
  }

  for (int i=0; i<spButtons.length; i++) {
    CalcButton ispButtons = spButtons[i];
    ispButtons.click();
    if (ispButtons.overBox) {
      if (ispButtons.spButtonValue == ".") {
      } else if (firstNum) {
        valueToCompute += ispButtons.spButtonValue;
        displayValue = valueToCompute2;
      }
    }
  }
}

void performCalculation() {
  //set string value to integers
  valueToComputeI = float (valueToCompute);
  valueToComputeII = float (valueToCompute2);

  //perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeII;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeII;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeII;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeII;
    displayValue = str(result);
  }
  // let = work multiple times
  /* if (firstNum) {
   valueToCompute = displayValue;
   } else if {
   valueToCompute = displayValue;
   valueToCompute2 = "";
   } else if (opValue == "n") {
   if (firstNum) {
   valueToComputeI = valueToComputeI*-1;
   displayValue = str(valueToComputeI);
   } else {
   valueToComputeII = valueToComputeII*-1;
   displayValue = str(valueToCompute);
   }
   }*/
}

void updateDisplay () {
  fill(200, 200, 150);
  rect(10, 10, 130, 35, 7);
  fill(0);
  textSize(25);
  text(displayValue, 20, 37);
}

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


