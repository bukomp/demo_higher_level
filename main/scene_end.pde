class Outro {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;

  // VARIABLES FOR SCENE 6
  String[] groupNames = {"DIGITAL", "FRONTIER"};
  int[] palette = {PINK, BLUE, LIGHTBLUE, YELLOW};
  int letterIndex = 0;
  int wordIndex = 0;
  int flashDuration = 10;  // flash duration in frames
  int frameCounter = 0;
  int delayTime = 60;  // delay between each letter
  boolean flash = false;

  Outro() {
    this.gridVisible = false;
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;

    // SETUP VARIABLES FOR SCENE 6
    background(255);
    textSize(200); // Change this value for bigger or smaller text
    textAlign(CENTER, CENTER);
  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
    background(255);  // White background

    // Create a black flash for `flashDuration` frames when a new letter is added
    if (flash) {
      if (frameCounter <= flashDuration) {
        background(0);  // Black flash
        frameCounter++;
      }
      else {
        flash = false;
        frameCounter = 0;
      }
    }

    // After the flash, reveal the text letter by letter
    if (frameCounter % delayTime == 0) {
      if (letterIndex < groupNames[wordIndex].length()) {
        flash = true;
        letterIndex++;
      } else if (wordIndex < groupNames.length - 1) {
        wordIndex++;
        letterIndex = 0;
      }
    }

    // Draw the part of the group name that should be visible
    for (int j = 0; j <= wordIndex; j++) {
      for (int i = 0; i < (j < wordIndex ? groupNames[j].length() : letterIndex); i++) {
        textSize(150); // Change this value for bigger or smaller text
        textAlign(CENTER, CENTER);
        fill(palette[i % palette.length]);  // Color from palette for each letter
        text(groupNames[j].charAt(i), width/2 - (groupNames[j].length() * 50) + (i * 100), height/2 + (j * 200) - 100);
      }
    }

    frameCounter++;  // Increase frame counter

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
