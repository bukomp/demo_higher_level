class TextLine {
  float size;
  float rotation;
  float xPos;
  float yPos;
  color lineColor;
  String text;
  float blur;  // Add blur parameter

  TextLine(float size, float rotation, float xPos, float yPos, color lineColor, String text, float blur) {
    this.size = size;
    this.rotation = rotation;
    this.xPos = xPos;
    this.yPos = yPos;
    this.lineColor = lineColor;
    this.text = text;
    this.blur = blur;  // Initialize blur parameter
  }

  void display() {
    pushMatrix();
    translate(xPos, yPos);
    rotate(radians(rotation));
    textSize(size);
    
    // Display semi-transparent duplicates for blur effect
    int blurSteps = 5;
    for (int i = -blurSteps; i <= blurSteps; i++) {
      for (int j = -blurSteps; j <= blurSteps; j++) {
        fill(red(lineColor), green(lineColor), blue(lineColor), alpha(lineColor) / (blurSteps * blur));
        text(text, i * blur, j * blur);
      }
    }
    
    // Display original text
    fill(lineColor);
    text(text, 0, 0);
    
    popMatrix();
  }

  // Method to change blur of line
  void changeBlur(float newBlur) {
    this.blur = newBlur;
  }

  // Method to change position of line
  void changePosition(float newXPos, float newYPos) {
    this.xPos = newXPos;
    this.yPos = newYPos;
  }

  // Method to change text in line
  void changeText(String newText) {
    this.text = newText;
  }

  // Method to change color of line
  void changeColor(color newColor) {
    this.lineColor = newColor;
  }
}
