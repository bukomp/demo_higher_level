class Grid {
  // Define the properties
  color lineColor;
  float blurAmount;

  // Define the constructor
  Grid(color _lineColor, float _blurAmount) {
    lineColor = _lineColor;
    blurAmount = _blurAmount;
  }

  void display() {
      float gapStep = 0.6;
      
      for (int y = height/2; y <= height+height/5; y += pow(y/65,2)) {
        float distanceFromYCenter = abs(y - height / 2+height/100);
        float gapY = distanceFromYCenter * gapStep;
        stroke(lineColor);
        filter( BLUR, blurAmount * (distanceFromYCenter/230) );
        strokeWeight(distanceFromYCenter/60);
        line(width, y+gapY, 0, y+gapY);
      }

      for (int x = -width*2; x <= width*2; x += 100) {
        float distanceFromXCenter = abs(x - width / 2);
        float gapX = distanceFromXCenter * gapStep;
        stroke(lineColor);
        filter( BLUR, blurAmount );
        strokeWeight(2);
        if(x<width / 2){
          line(x-gapX*0.6, height, x+gapX, height/2+height/100);
        } else {
          line(x+gapX*0.6, height, x-gapX, height/2+height/100);
        }
      }

      for (int y = height/2; y <= height+height/5; y += pow(y/65,2)) {
        float distanceFromYCenter = abs(y - height / 2+height/100);
        float gapY = distanceFromYCenter * gapStep;
        stroke(lineColor);
        strokeWeight(1+distanceFromYCenter/150);
        line(width, y+gapY, 0, y+gapY);
      }

      for (int x = -width*2; x <= width*2; x += 100) {
        float distanceFromXCenter = abs(x - width / 2);
        float gapX = distanceFromXCenter * gapStep;
        stroke(lineColor);
        strokeWeight(2);
        if(x<width / 2){
          line(x-gapX*0.6, height, x+gapX, height/2);
        } else {
          line(x+gapX*0.6, height, x-gapX, height/2);
        }
      }
    }

      // Method to change stroke color
  void changeStrokeColor(color newColor) {
    lineColor = newColor;
  }
  
}