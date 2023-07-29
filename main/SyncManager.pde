class SyncManager {
  float[] mainTimeStamps;
  float[] sceneTimeStamps;
  int currentSceneMusicSyncIndex = 0;
  int currentSceneIndex = 0;
  float songPos = 0.0;
    
  SyncManager() {
    this.mainTimeStamps = new float[] {1.5, 2.3, 4.2, 5.0, 6.7, 7.1, 9.5, 11.0, 12.4, 13.2};
    this.sceneTimeStamps = new float[] {12.0, 18.0, 24.0, 30.0, 36.0, 42.0, 48.0, 54.0, 60.0};
  }
  
  void UpdateSongPos(float songPos) {
    this.songPos = songPos;
    // if the current song position has passed the next timestamp
    if(this.songPos > this.mainTimeStamps[this.currentSceneMusicSyncIndex]) {
      // move on to the next timestamp
      this.currentSceneMusicSyncIndex++;
    }
    if(this.songPos > this.sceneTimeStamps[this.currentSceneIndex]) {
      // move on to the next timestamp
      this.currentSceneIndex++;
    }
  }
  
  int getCurrentMusicSyncIndex() {
    return this.currentSceneMusicSyncIndex;
  }
  
  int getCurrentSceneIndex() {
    return this.currentSceneIndex;
  }
  
  // Returns current position in the scene step in seconds.milliseconds
  float getCurrentScenePosition() {
    float currentStepPos = this.sceneTimeStamps[this.currentSceneIndex];
    float nextStepPos = this.sceneTimeStamps[this.currentSceneIndex+1];
    float timeMax = nextStepPos - currentStepPos;
    float timePos = songPos - currentStepPos;
    return timePos;
  }
  
  // Returns 0..1
  float getCurrentScenePositionNormalized() {
    float currentStepPos = this.sceneTimeStamps[this.currentSceneIndex];
    float nextStepPos = this.sceneTimeStamps[this.currentSceneIndex+1];
    float timeMax = nextStepPos - currentStepPos;
    float timePos = songPos - currentStepPos;
    float normalizedTimePosition = timePos / timeMax;
    return normalizedTimePosition;
  }
  
  float getSongPos() {
    return this.songPos;
  }
  
  boolean isDemoFinished() {
    return this.currentSceneMusicSyncIndex >= this.mainTimeStamps.length? true : false;
  }
}
