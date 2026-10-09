class Button {
  // Member Variables
  float x, y, w, h;
  char val;
  boolean hover;
  color c1, c2;

  // Constructor
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    hover = false;
    c1 = color(45);
    c2 = color(70);
  }

  void display() {
    rectMode(CENTER);
    stroke(#111417);
    strokeWeight(5);
    //This is where you display every operator button
    if (val == 'C') {
      fill(#E94A58);
    } else if (val == '=') {
      fill(#5B995F);
    } else if (val == '÷' || val == '×' || val == '-' || val == '+') {
      fill(#AEB0B2);
    } else if (val == '%' || val == '²' || val == 'a' || val == '√') {
      fill(#292E34);
    } else {
      fill(#292E34);
    }

    if (hover) {
      fill(120);
    }

    rect(x, y, w, h, 8);

    noStroke();
    textAlign(CENTER, CENTER);
    // This is where you display the text and the color for the button
    if (val >= '0' && val <= '9') {
      fill(255);
      textSize(28);
      text(val, x, y);
    } else if (val == '%' || val == '²' || val == 'a' || val == '√') {
      fill(255);
      textSize(30);
      text(val, x, y);
    } else if (val == 'C') {
      fill(#000000);
      textSize(24);
      text("CLR", x, y);
    } else if (val == '=') {
      fill(#000000);
      textSize(30);
      text("=", x, y);
    } else if (val == '÷') {
      fill(#000000);
      textSize(28);
      text("÷", x, y);
    } else if (val == '×') {
      fill(#000000);
      textSize(28);
      text("×", x, y);
    } else if (val == '±') {
      fill(255);
      textSize(25);
      text("±", x, y);
    } else if (val == '.') {
      fill(255);
      textSize(25);
      text(".", x, y);
    } else {
      fill(#000000);
      textSize(25);
      text(val, x, y);
    }
  }

  void mouseOver(float mx, float my) {
    if (mx > x - w/2 && mx < x + w/2 &&
        my > y - h/2 && my < y + h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
