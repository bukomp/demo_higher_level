class Intro {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;
  GlowingGrid glowingGrid;
  TextLine[] myLines;


  // Constructor of the Intro class
  Intro() {
    this.gridVisible = false;
    this.timestamps = new float[] {0.01, 6.8, 11.0}; 
    this.currentTimestampIndex = 0;
    this.glowingGrid = new GlowingGrid(20, 20, 20.0);
    this.myLines = new TextLine[]{
      new TextLine(24, 45, width/2, height/2, color(255, 0, 0), "Hello, Processing!", 0),
      new TextLine(24, 90, width/3, height/3, color(0, 255, 0), "Hello again, Processing!", 1.0)
    };
  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
    background(0);

    if(this.currentTimestampIndex == 0){
      for (TextLine line : myLines) {
        line.display();
      }
      // Trigger a visual event (e.g., change background color)

      //this.glowingGrid.display(width/2, height/2);
    }
  
    // If the current song position has passed the next timestamp
    if(scenePos > this.timestamps[this.currentTimestampIndex]) {
      // Trigger a visual event (e.g., change background color)
      //this.myGrid.changeStrokeColor(color(random(255), random(255), random(255)));
      // Move on to the next timestamp
      this.currentTimestampIndex++;
    }
      this.updateLines(2);


  }

  void changeAllTexts(String newText) {
    for (TextLine line : myLines) {
      line.changeText(newText);
      line.display();
    }
  }

  void updateLines(float step) {
  for (int i = 0; i < myLines.length; i++) {
    TextLine line = myLines[i];

    // Move and rotate every first line to the right
    if (i % 2 == 0) {
      line.changePosition(line.xPos + step*2, line.yPos+step);
      line.rotation = 22.5;
    }
    // Move and rotate every second line to the left
    else {
      line.changePosition(line.xPos - step*2, line.yPos-step);
      line.rotation = 22.5;
    }
  }
}
}


