class GlowingGrid {
  int rows, cols;
  float cellSize;
  PShape gridShape;

  GlowingGrid(int rows, int cols, float cellSize) {
    this.rows = rows;
    this.cols = cols;
    this.cellSize = cellSize;
    this.gridShape = createShape(GROUP);
    
    for (int i = 0; i <= rows; i++) {
      for (float j = 0.0; j <= 20.0; j += 0.5) {
        float alpha = 100.0 - j * 5;
        PShape lineShape = createShape();
        lineShape.beginShape(LINES);
        lineShape.stroke(255, alpha);
        lineShape.strokeWeight(2);
        lineShape.vertex(0, i * cellSize);
        lineShape.vertex(cols * cellSize, i * cellSize);
        lineShape.endShape();
        gridShape.addChild(lineShape);
      }
    }
    
    for (int i = 0; i <= cols; i++) {
      for (float j = 0.0; j <= 20.0; j += 0.5) {
        float alpha = 100.0 - j * 5;
        PShape lineShape = createShape();
        lineShape.beginShape(LINES);
        lineShape.stroke(255, alpha);
        lineShape.strokeWeight(2);
        lineShape.vertex(i * cellSize, 0);
        lineShape.vertex(i * cellSize, rows * cellSize);
        lineShape.endShape();
        gridShape.addChild(lineShape);
      }
    }
  }

  void display(float x, float y) {
    pushMatrix();
    translate(x-(this.rows*this.cellSize)/2, y-(this.cols*this.cellSize)/2);
    shape(gridShape);
    popMatrix();
  }
}
