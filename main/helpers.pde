int cell = 50; //set a grid cell

void grid () {
  background(0);  // We're using a black background for a better neon effect

  float gapStep = 0.6;  // Adjust this for more or less curve

  //horizontal lines with for() function
  for (int y = height/2+50; y <= height+500; y += pow(y/65,2)) {
    float distanceFromYCenter = abs(y - width / 2+50);
    float gapY = distanceFromYCenter * gapStep;
    stroke(255, 0, 255);
    filter( BLUR, distanceFromYCenter/230 );
    strokeWeight(distanceFromYCenter/60);
    line(width, y-gapY, 0, y-gapY);
  }
  
  for (int x = -width*2; x <= width*2; x += 100) {
    float distanceFromXCenter = abs(x - width / 2);
    float gapX = distanceFromXCenter * gapStep;
    if(x<width / 2){
      stroke(255, 0, 255);
          filter( BLUR, 2 );
      strokeWeight(2);
      line(x-gapX*0.6, height, x+gapX, height/2+50);
    } else {
      stroke(255, 0, 255);
          filter( BLUR, 2 );
      strokeWeight(2);
      line(x+gapX*0.6, height, x-gapX, height/2+50);
    }
  }
  
    //horizontal lines with for() function
  for (int y = height/2+50; y <= height+500; y += pow(y/65,2)) {
    float distanceFromYCenter = abs(y - width / 2+50);
    float gapY = distanceFromYCenter * gapStep;
    stroke(255, 70, 255);
    strokeWeight(1+distanceFromYCenter/150);
    line(width, y-gapY, 0, y-gapY);
  }

    
  for (int x = -width*2; x <= width*2; x += 100) {
    float distanceFromXCenter = abs(x - width / 2);
    float gapX = distanceFromXCenter * gapStep;
    if(x<width / 2){
      stroke(255, 100, 255);
      strokeWeight(2);
      line(x-gapX*0.6, height, x+gapX, height/2+50);
    } else {
      stroke(255, 100, 255);
      strokeWeight(2);
      line(x+gapX*0.6, height, x-gapX, height/2+50);
    }
  }
}