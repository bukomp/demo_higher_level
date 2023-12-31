class SyncManager {
  float[] mainTimeStamps;
  float[] sceneTimeStamps;
  int currentSceneMusicSyncIndex = 0;
  int currentSceneIndex = 0;
  float songPos = 0.0;
    
  SyncManager() {
    this.mainTimeStamps = new float[] {0.408413, 1.375884, 1.563352, 2.711595, 3.113313, 3.300782, 3.494945, 4.261557, 4.442330,
                                        4.636493, 5.413148, 6.173064, 6.380618, 6.581477, 7.522166, 7.712982, 7.903798, 8.871269, 
                                      9.048694, 9.249553, 9.457107, 9.631185, 9.915735, 10.407840, 10.595308, 10.799514, 11.164408,
                                      11.559431, 12.328131,12.599131,13.184131, 15.410114, 18.489089, 18.885083, 19.846144, 20.030781, 20.797736, 
                                       21.176480, 21.555223, 21.739860, 21.957637, 22.913964, 23.098601, 23.292707, 23.875025, 
                                       24.073865, 24.796, 24.910, 25.484, 25.833, 26.026, 26.218, 26.488, 26.760, 26.953, 27.158, 27.242, 27.709800, 27.818, 27.944, 28.102, 28.410, 29.10, 29.181, 29.259, 29.486, 29.835, 30.027, 30.275, 30.781629, 33.570851, 36.937955, 40.009486, 43.126194, 49.247259, 60.027609};
    this.sceneTimeStamps = new float[] {0,12.325131, 18.489089, 24.645389, 30.781629, 36.937955, 43.126194, 49.247259, 60.027609, 60.5};
  }
  
  void UpdateSongPos(float songPos) {
    this.songPos = songPos;
    // if the current song position has passed the next timestamp
    if(this.songPos > this.mainTimeStamps[this.currentSceneMusicSyncIndex]) {
      // move on to the next timestamp
      this.currentSceneMusicSyncIndex++;
    }
    if(this.songPos > this.sceneTimeStamps[this.currentSceneIndex+1]) {
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

  // Returns 1..0
  float getCurrentScenePositionNormalizedOverdrive() {
    float currentStepPos = this.sceneTimeStamps[this.currentSceneIndex];
    float nextStepPos = this.sceneTimeStamps[this.currentSceneIndex+1];
    float timeMax = nextStepPos - currentStepPos;
    float timePos = songPos - currentStepPos;
    float normalizedTimePosition = timePos / timeMax;
    return 1 - normalizedTimePosition;
  }
  
  float getSongPos() {
    return this.songPos;
  }
  
  boolean isDemoFinished() {
    return this.currentSceneMusicSyncIndex >= this.mainTimeStamps.length? true : false;
  }
}
