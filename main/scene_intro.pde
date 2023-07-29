class Intro {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;
  GlowingGrid glowingGrid;

  // Constructor of the Intro class
  Intro() {
    this.gridVisible = false;
    this.timestamps = new float[] {0.5, 6.8, 11.0}; 
    this.currentTimestampIndex = 0;
    this.glowingGrid = new GlowingGrid(20, 20, 20.0);
  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
    background(random(255), random(255), random(255));

    if(this.currentTimestampIndex == 0){
      // Trigger a visual event (e.g., change background color)
            translate(0, height/3, 0);
      rotateX(45);

      this.glowingGrid.display(width/2, height/2);
    }
  
    // If the current song position has passed the next timestamp
    if(scenePos > this.timestamps[this.currentTimestampIndex]) {
      // Trigger a visual event (e.g., change background color)
      
      //this.myGrid.changeStrokeColor(color(random(255), random(255), random(255)));
      // Move on to the next timestamp
      this.currentTimestampIndex++;
    }
  }
}