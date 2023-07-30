class Scene1 {
  boolean gridVisible;
  float[] timestamps;
  int lastMs;
  int currentTimestampIndex;
  int currentMusicTimeStamp;
  int beatCounter;
  TextLine levelup;


  Scene1() {
    this.gridVisible = false;
    this.timestamps = new float[] {0.01, 15.41, 99.0}; 
    this.lastMs = 0;
    this.currentTimestampIndex = 0;
    this.currentMusicTimeStamp = 0;
    this.beatCounter = 0;
    this.levelup = new TextLine(height/4, 0, height/2.5, height/1.8, color(random(255), random(255), random(255)), "Level Up!");
  }

  void play() {

    int songPos = int(syncManager.getSongPos()*1000);
    float scenePos = syncManager.getCurrentScenePosition();
    background(random(255), random(255), random(255));
    this.levelup.display();
    this.levelup.changeColor(color(random(255), random(255), random(255)));


    if(songPos > this.lastMs){
      this.lastMs = songPos;
      if(this.currentMusicTimeStamp < syncManager.getCurrentMusicSyncIndex()){
        this.currentMusicTimeStamp = syncManager.getCurrentMusicSyncIndex();
        this.beatCounter++;
        switch(this.beatCounter){
          case 1:
              this.levelup.changePosition(0, height/4);
            break;
          case 2:
              this.levelup.changePosition(height/1.3, height-height/4);
            break;
          case 3:
              this.levelup.changePosition(0, height-height/4);
            break;
          default:
              this.levelup.changePosition(height/2.5, height/1.8);
            break;
        }

      }

    }

    if(scenePos > this.timestamps[this.currentTimestampIndex+1]) {
      this.currentTimestampIndex++;
    }
  }
}
