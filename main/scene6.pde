class Scene6 {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;


  // The number of circles
  int numCircles = 50;

  // The circles' sizes
  float[] circleSizes = new float[numCircles];

  // The rate at which the circles grow
  float growthRate = 1.025f;

  // Index of the circle used for the car's size
  int carCircleIndex = 0;

  // Define the color codes
  color color1 = color(unhex("ED"), unhex("18"), unhex("BF")); // Pink color
  color color2 = color(unhex("42"), unhex("11"), unhex("ED")); // Blue color

  Scene6() {
    this.gridVisible = false;
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;

    // SETUP FOR SCENE 6
    smooth(); 

    
    // Initialize the circle sizes
    for (int i = 0; i < numCircles; i++) {
      circleSizes[i] = i * 6;
    }
    
    // Set the drawing mode to be from the center
    ellipseMode(CENTER);
    imageMode(CENTER);
    
 
    
    // No stroke on the circles
    noStroke();

  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();

    // Draw each circle
    for (int i = numCircles - 1; i >= 0; i--) {
      // Choose the color based on the index
      fill(i % 2 == 0 ? color1 : color2);
      
      // Draw the circle
      ellipse(width/2, height/2, circleSizes[i] * 3, circleSizes[i] * 3);
    
      // Grow the circle
      circleSizes[i] *= growthRate;

      // If the circle has grown too large, reset its size
      if (circleSizes[i] > width/2) {
        circleSizes[i] = 0;
  
        // Change the shape used for the car's size
        carCircleIndex = (i + 1) % numCircles;
      }
      
    }

    // Draw the car - make it shrink as it moves towards the end
    float carSize = width/2*syncManager.getCurrentScenePositionNormalizedOverdrive();
    image(car, width/2, height/2, carSize, carSize);
  
    // Draw the text and make it grow as the car shrinks
    float textSize = map(carCircleIndex, 0, numCircles, 0, width/2);
    fill(255, 0, 255);
    textSize(textSize);
    text("reach new heights", width/2, height/1.8);


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
