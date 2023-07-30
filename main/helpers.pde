class TextLine {
  float size;
  float rotation;
  float xPos;
  float yPos;
  color lineColor;
  String text;

  TextLine(float size, float rotation, float xPos, float yPos, color lineColor, String text) {
    this.size = size;
    this.rotation = rotation;
    this.xPos = xPos;
    this.yPos = yPos;
    this.lineColor = lineColor;
    this.text = text;
  }

  void display() {
    pushMatrix();
    translate(xPos, yPos);
    rotate(radians(rotation));
    textSize(size);
  
    // Set the alignment to center
    textAlign(CENTER, CENTER);
  
    // Display original text
    fill(lineColor);
    text(text, 0, size/3);
  
    popMatrix();
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

  // Method to change alignment of line
  void changeAlign(int x, int y) {
    textAlign(x, y);
  }
}
