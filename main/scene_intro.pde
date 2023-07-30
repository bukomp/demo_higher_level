class Intro {
  float[] timestamps;
  int currentTimestampIndex;
  TextLine[] myLines;
  int lastMs;
  int lastMusicTimeStamp;

  // Constructor of the Intro class
  Intro() {
    this.timestamps = new float[] {0.01, 6.8, 99.0}; 
    this.currentTimestampIndex = 0;
    this.lastMs = 0;
    this.lastMusicTimeStamp = 0;

    int minSize = 50;  // minimum text size
    int maxSize = 200;  // maximum text size
    color textColor = color(255,221,66,0);  // yellow

    float heightInterval = height / 11;
    float widthInterval = 1920 ;

this.myLines = new TextLine[]{
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 1.7f, textColor, "Growth exists in every bug."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 2.4f, textColor, "Master syntax, master the universe."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 3.6f, textColor, "Iterate. Optimize. Innovate. Repeat."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 4.8f, textColor, "Develop solutions, develop self."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 5.9f, textColor, "Optimization is the key step."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 6.2f, textColor, "Innovation is vital for success."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 7.3f, textColor, "Perseverance leads to great outcomes."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 8.5f, textColor, "Learning is an ongoing process."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 9.8f, textColor, "Evolution is a continuous process."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 10.1f, textColor, "Embrace failure, discover success."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 11.6f, textColor, "Creativity flourishes in constraints."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 12.7f, textColor, "Continuous learning, continuous growth."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 13.2f, textColor, "Think big, start small, move fast."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 14.5f, textColor, "Code is poetry, developers are poets."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 15.8f, textColor, "Code beautifully and code responsibly."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 16.3f, textColor, "First solve the problem, then write code."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 17.1f, textColor, "If it works, test it more."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 18.6f, textColor, "Quality isn't an act, it's habit."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 19.7f, textColor, "Refactoring is a necessary step."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 20.0f, textColor, "Collaboration fosters better solutions."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 14.6f, textColor, "Simplicity is the essence of efficiency."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 3.9f, textColor, "First, solve the problem. Then, write code."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 0.4f, textColor, "Code truthfully, comments can deceive."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 6.8f, textColor, "Good code takes time, don't rush."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 12.1f, textColor, "Code is like humor, don't over-explain."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 8.5f, textColor, "Learn to code, learn to innovate."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 16.3f, textColor, "Great programmers are truly creators."),
  new TextLine(random(minSize, maxSize), 23.5, widthInterval, heightInterval * 2.8f, textColor, "In coding, mistakes are learning opportunities.")
  
};


}

  boolean timestampHandled = false;
  void play() {

    int songPos = int(syncManager.getSongPos()*1000);
    float scenePos = syncManager.getCurrentScenePosition();
    background(237, 24, 191);

    if(songPos > this.lastMs){

      this.lastMs = songPos;
      this.updateLines(1, this.myLines);

      if(lastMusicTimeStamp < syncManager.getCurrentMusicSyncIndex() && this.currentTimestampIndex != 1){
        lastMusicTimeStamp = syncManager.getCurrentMusicSyncIndex();
        if(lastMusicTimeStamp<this.myLines.length){
        this.myLines[lastMusicTimeStamp].changeColor(color(255,221,66,255));
        this.myLines[lastMusicTimeStamp+1].changeColor(color(255,221,66,255));
        }
      }

    }

    if(this.currentTimestampIndex == 1){
      setBackground(pow(syncManager.getCurrentScenePositionNormalized(),7));

      for (TextLine line : myLines) {

        if(line.lineColor !=  color(255,221,66,255)){
          line.changeColor(color(255,221,66,pow(syncManager.getCurrentScenePositionNormalized(),7)*255));
        }
        line.display();

      }
      
    } else if (this.currentTimestampIndex == 0){
      for (TextLine line : myLines) {
        line.display();
      }
    }
  
    // If the current song position has passed the next timestamp
    if(scenePos > this.timestamps[this.currentTimestampIndex+1]) {
      // Trigger a visual event (e.g., change background color)
      //this.myGrid.changeStrokeColor(color(random(255), random(255), random(255)));
      // Move on to the next timestamp
      this.currentTimestampIndex++;
    }


  }

  void setBackground(float parameter) {

    color startColor = color(237, 24, 191);
    color endColor = color(255, 221, 66);
    color currentColor = lerpColor(startColor, endColor, parameter);

    background(currentColor);
  }



  void updateLines(float step, TextLine[] lines) {
  for (int i = 0; i < lines.length; i++) {
    TextLine line = lines[i];

    // Move and rotate every first line to the right
    if (i % 2 == 0) {
      line.changePosition(line.xPos + step*2, line.yPos+step);
    }
    // Move and rotate every second line to the left
    else {
      line.changePosition(line.xPos - step*2, line.yPos-step);
    }
  }
}
}
