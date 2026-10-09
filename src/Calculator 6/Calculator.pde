// Dylan Codell | 15 Sept 2026 |
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[8];
Button[] dpadButtons = new Button[4];

float l, r, result;
char op, dpad;
boolean left, newEntry;
String displayVal;

void setup() {
  size(550, 700);

  l = 0.0;
  r = 0.0;
  result = 0.0;
  left = true;
  newEntry = true;
  op = ' ';
  displayVal = "0.0";

  // Number Buttons
  numButtons[0] = new Button(225, 640, 100, 60, '0');
  numButtons[1] = new Button(115, 570, 100, 60, '1');
  numButtons[2] = new Button(225, 570, 100, 60, '2');
  numButtons[3] = new Button(335, 570, 100, 60, '3');
  numButtons[4] = new Button(115, 500, 100, 60, '4');
  numButtons[5] = new Button(225, 500, 100, 60, '5');
  numButtons[6] = new Button(335, 500, 100, 60, '6');
  numButtons[7] = new Button(115, 430, 100, 60, '7');
  numButtons[8] = new Button(225, 430, 100, 60, '8');
  numButtons[9] = new Button(335, 430, 100, 60, '9');

  // Operator buttons
  opButtons[0] = new Button(115, 640, 100, 60, '.');
  opButtons[3] = new Button(335, 640, 100, 60, '±');
  opButtons[5] = new Button(445, 430, 100, 60, '÷');
  opButtons[4] = new Button(445, 500, 100, 60, '×');
  opButtons[1] = new Button(445, 570, 100, 60, '-');
  opButtons[2] = new Button(445, 640, 100, 60, '+');
  opButtons[6] = new Button(445, 290, 100, 60, 'C');
  opButtons[7] = new Button(335, 360, 100, 60, '=');

  // D-Pad Buttons
  dpadButtons[0] = new Button(130, 240, 60, 60, '%');
  dpadButtons[1] = new Button(130, 360, 60, 60, '²');
  dpadButtons[2] = new Button(75, 300, 60, 60, 'a');
  dpadButtons[3] = new Button(185, 300, 60, 60, '√');
}


void draw() {
  background(#E6E6E6);

  // Calculator Body
  fill(#BFC1C2);
  stroke(#202428);
  strokeWeight(6);
  rectMode(CORNER);
  rect(20, 15, 510, 680);


  // CALC BOY TITLE
  fill(#30343A);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(30);
  text("CALC-BOY", 275, 45);



  drawDisplay();


  // D-Pad Buttons thingy
  for (int i = 0; i < dpadButtons.length; i++) {
    dpadButtons[i].display();
    dpadButtons[i].mouseOver(mouseX, mouseY);
  }


  // Number Buttons
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }


  // Operator Buttons
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}


void drawDisplay() {
  rectMode(CENTER);

  // Screen stuff
  fill(#30353A);
  stroke(#202428);
  strokeWeight(7);
  rect(275, 145, 470, 105);


  fill(#A8BA91);
  stroke(#11151A);
  strokeWeight(5);
  rect(275, 145, 440, 80);


  fill(#15191A);
  noStroke();
  textAlign(RIGHT, CENTER);
  textSize(36);
  text(displayVal, 490, 155);
}


void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover == true) {
      handleEvent(numButtons[i].val,true);
    }    
  }
  // Operator Buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val,true);

    }
  }
  // Dpad Buttons
  for (int i = 0; i < dpadButtons.length; i++) {
    if (dpadButtons[i].hover) {
      char clicked = dpadButtons[i].val;

      if (clicked == '=') {
        performCalc();
      } else if (clicked == '²') {
        //squares the number
        if (left == true) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '√') {
        //square roots the number
        if (left == true) {
          l = sqrt(l);
          displayVal = str(l);
        } else {
          r = sqrt(r);
          displayVal = str(r);
        }
      }
    }
  }


  // Display Variables
  println("L:" + l);
  println("R:" + r);
  println("Result:" + result);
  println("Left:" + left);
  println("Op:" + op);
}


void performCalc() {

  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '×') {
    result = l * r;
  } else {
    return;
  }
  displayVal = str(result);
  left = !left;
  l = result;
}

void keyPressed() {
  println("keyCode: "+ keyCode);
  // Number Buttons
if(keyCode == 49 || keyCode == 97){
handleEvent('1',true);
} else if(keyCode == 50 || keyCode == 98){
handleEvent('2',true);
} else if(keyCode == 51 || keyCode == 99){
handleEvent('3',true);
} else if(keyCode == 52 || keyCode == 100){
handleEvent('4',true);
} else if(keyCode == 53 || keyCode == 101){
handleEvent('5',true);
} else if(keyCode == 54 || keyCode == 102){
handleEvent('6',true);
} else if(keyCode == 55 || keyCode == 103){
handleEvent('7',true);
} else if(keyCode == 56 || keyCode == 104){
handleEvent('8',true);
} else if(keyCode == 57 || keyCode == 105){
handleEvent('9',true);
} else if(keyCode == 48 || keyCode == 96){
handleEvent('0',true);
// Operator buttons
}else if(keyCode == 10 || keyCode == 10){
handleEvent('=',false);
}
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    // Do number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }
    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // Do operator stuff
          char clicked = val;

      if (clicked == '=') {
        performCalc();
      } else if (clicked == '+' || clicked == '-' || clicked == '×' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked == '±') {
        if (left == true) {
          l *= -1;
          displayVal = str(l);
        } else {
          r *= -1;
          displayVal = str(r);
        }
      } else if (clicked == 'C') {
        // reset all variables
        l = 0.0;
        r = 0.0;
        result = 0.0;
        left = true;
        newEntry = true;
        op = ' ';
        displayVal = "0.0";
      } else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          displayVal += '.';
        }
      }
  }
}
