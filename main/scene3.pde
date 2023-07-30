class Scene3 {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;

  // Variables for the scene 3
  static final int NUM_LINES = 15;
  float t;
  float shakeAmount = 20;
  String letters = "higherhigherhigherhigherhigherhigher";
  int currentLetterIndex = 0;
  int lastChangeTime = 0; // Variable to hold the last time the letter was changed

  // Define shaking parameters
  int shakingStartTime = 5000; // Time when shaking starts (in milliseconds)
  int shakingDuration = 5000; // Duration of shaking (in milliseconds)

  Scene3() {
    this.gridVisible = false;
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;

    // Set up text properties for scene 3
    textAlign(CENTER, CENTER);
    textSize(100);
  }

  boolean timestampHandled = false;
  int lastMusicSyncIndex = 0;
  boolean didInitialEffect = false;
  boolean didSecondEffect = false;

  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
    if (lastMusicSyncIndex != syncManager.getCurrentMusicSyncIndex()){
      lastMusicSyncIndex = syncManager.getCurrentMusicSyncIndex();
      timestampHandled = false;
    }
      // Switch color every 2 seconds
    color currentColor = (millis()/2000 % 2 == 0) ? LIGHTBLUE : YELLOW;
    
    // Set the color for the lines and background
    stroke(currentColor);
    background(255 - red(currentColor), 255 - green(currentColor), 255 - blue(currentColor));
    strokeWeight(5);
    
    translate(width/2, height/2);
    for (int i = 0; i < NUM_LINES; i++){
      float shakeX1 = 0, shakeY1 = 0, shakeX2 = 0, shakeY2 = 0;
    if (millis() >= shakingStartTime && millis() <= shakingStartTime + shakingDuration) {
      // If within the shaking time window, apply the shaking
      shakeX1 = random(-shakeAmount, shakeAmount);
      shakeY1 = random(-shakeAmount, shakeAmount);
      shakeX2 = random(-shakeAmount, shakeAmount);
      shakeY2 = random(-shakeAmount, shakeAmount);
    }
      line(x1(t+i)+shakeX1, y1(t+i)+shakeY1, x2(t+i)+shakeX2, y2(t+i)+shakeY2);
      line(y1(t+i)+shakeY1, x1(t+i)+shakeX1, y2(t+i)+shakeY2, x2(t+i)+shakeX2);
    }
    t += 1;

    println(lastMusicSyncIndex);


    // Change letter in the middle
    if (millis() - lastChangeTime >= 100) {
      currentLetterIndex = (currentLetterIndex + 1) % letters.length();
      lastChangeTime = millis();
    }
    
    // Draw the current letter
    text(letters.charAt(currentLetterIndex), 0, 0);
    fill(255, 255, 255);

    if (timestampHandled = false) {
      if (didInitialEffect && !didSecondEffect) {
        //PUT CRAZY EFFECT HERE
        didSecondEffect = true;
      }
      if (!didInitialEffect) {
        //PUT CRAZY EFFECT HERE
        didInitialEffect = true;
      } 
      
      timestampHandled = true;
    }
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
  
  float x1(float t) {
  return sin(t/10)*100;
}

float y1(float t) {
  return cos(t/10)*100;
}

float x2(float t) {
  return sin(t/10)*200;
}

float y2(float t) {
  return cos(t/10)*200;
}
}
