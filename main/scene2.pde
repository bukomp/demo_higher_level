class Scene2 {
  float[] timestamps;
  int currentTimestampIndex;

  // define pshape
  PShape tree;
  
  // define the angle for branches
  float theta;   
  
  // define time variables
  int startTime;
  int currentTime;
  int timeDiff;
  int growRate = 430; // growth rate in milliseconds
  int maxTime = 6000; // maximum time in milliseconds

  Scene2() {
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;
    tree = createShape(GROUP);
  }

  float extraheight = 100.0;
  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
    background(237, 24, 191);
    
    currentTime = millis(); // get the current time
    timeDiff = currentTime - startTime; // calculate the difference
  
    // calculate the level of the tree based on time
    int level = (int)(timeDiff / growRate); 
  
    // limit the level to a maximum value (for this case, 6)
    level = constrain(level, 0, 9);
    
    // call the function to draw the fractal tree
    stroke(254, 234, 78, 70);
    strokeWeight(30);
    drawTree(width/2, height+150+(extraheight*syncManager.getCurrentScenePositionNormalized()+(extraheight*syncManager.getCurrentScenePositionNormalized())), 400, 0, level);
    stroke(254, 234, 78);
    strokeWeight(15);
    drawTree(width/2, height+150+(extraheight*syncManager.getCurrentScenePositionNormalized()+(extraheight*syncManager.getCurrentScenePositionNormalized())), 400, 0, level);
    
    stroke(254, 234, 78);
    strokeWeight(8);
    drawTree(width/5, height-250+(extraheight*syncManager.getCurrentScenePositionNormalized()), 200, 0, level);
    stroke(254, 234, 78);
    strokeWeight(8);
    drawTree(width-(width/5), height-250+(extraheight*syncManager.getCurrentScenePositionNormalized()), 200, 0, level);
   
    textAlign(LEFT, BOTTOM);  // align text to top right
    textSize(90);  // large timer text
    fill(255, 255, 255);
    
    // display the timer text in the top right corner
    text("WE GROW HIGHER", 20 , height-20);
    
    // if the maximum time has been reached, reset the start time
    if (timeDiff > maxTime) {
      startTime = millis();
    }
  }
  
  void drawTree(float x1, float y1, float len, float angle, int level) {
    float x2 = x1 + len * sin(radians(angle));
    float y2 = y1 - len * cos(radians(angle));
    
    line(x1, y1, x2, y2);
  
    if (level > 0) {
      drawTree(x2, y2, len * 0.67, angle - 30, level - 1);
      drawTree(x2, y2, len * 0.67, angle + 30, level - 1);
    }
  }
}
