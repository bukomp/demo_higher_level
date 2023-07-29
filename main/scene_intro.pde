class Intro {
  boolean gridVisible;
  float[] timestamps;
  Grid myGrid;
  int currentTimestampIndex;

  // Constructor of the Intro class
  Intro() {
    this.gridVisible = false;
    this.timestamps = new float[] {1.5, 2.3, 4.2, 5.0, 6.7, 7.1, 9.5, 11.0, 12.4, 13.2};
    this.currentTimestampIndex = 0;
    this.myGrid = new Grid(color(random(255), random(255), random(255)), 2);
  }

  void play() {
    background(random(255), random(255), random(255));

    // If there are no more timestamps, do nothing
    if(this.currentTimestampIndex >= this.timestamps.length) {
      this.myGrid = null;
      return;
    }
  
    // Get current song position in seconds
    float songPos = song.position() / 1000.0f;

    if(this.currentTimestampIndex == 0){
      // Trigger a visual event (e.g., change background color)
      this.myGrid.display();
    }
  
    // If the current song position has passed the next timestamp
    if(songPos > this.timestamps[this.currentTimestampIndex]) {
      // Trigger a visual event (e.g., change background color)
      this.myGrid.changeStrokeColor(color(random(255), random(255), random(255)));
      // Move on to the next timestamp
      this.currentTimestampIndex++;
    }
  }
}
