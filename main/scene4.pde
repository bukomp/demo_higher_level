class Scene4 {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;

  Scene4() {
    this.gridVisible = false;
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;
  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
background(0, 100, 100);
    //if(this.currentTimestampIndex == 0){
    //  // Trigger a visual event (e.g., change background color) on initial launch
    //}
  
    //// If the current song position has passed the next timestamp
    //if(scenePos > this.timestamps[this.currentTimestampIndex]) {
    //  // Trigger a visual event (e.g., change background color)
      
    //  // Move on to the next timestamp
    //  this.currentTimestampIndex++;
    //}
  }
}
