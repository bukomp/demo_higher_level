import ddf.minim.*;
Intro intro;
Minim minim;
AudioPlayer song;
SyncManager syncManager;

void setup() {
  size(1280, 720, P3D);
  
  minim = new Minim(this);
  intro = new Intro();
  syncManager = new SyncManager();
  song = minim.loadFile("data/Suspense__BPM156.mp3", 2048);
  song.play();
}

boolean MusicSyncHandled = false;
void draw() {  

  // if there are no more timestamps, do nothing
  if(syncManager.isDemoFinished()) {
    return;
  }
  
  // get current song position in seconds and update Syncer
  syncManager.UpdateSongPos(song.position() / 1000.0);
 
  switch (syncManager.getCurrentSceneIndex()) {
    case 0:
        intro.play(); 
      break;
  }
}

void stop() {
  // always close Minim audio classes when you finish with them
  song.close();
  minim.stop();
  super.stop();
}
