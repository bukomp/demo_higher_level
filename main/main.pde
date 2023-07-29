import ddf.minim.*;

Intro intro;
Scene1 scene1;
Scene2 scene2;
Scene3 scene3;
Scene4 scene4;
Scene5 scene5;
Scene6 scene6;
Scene7 scene7;
Outro outro;

Minim minim;
AudioPlayer song;
SyncManager syncManager;

void setup() {
  size(1280, 720);
  
  minim = new Minim(this);

  intro = new Intro();

  scene1 = new Scene1();
  scene2 = new Scene2();
  scene3 = new Scene3();
  scene4 = new Scene4();
  scene5 = new Scene5();
  scene6 = new Scene6();
  scene7 = new Scene7();

  outro = new Outro();

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
    case 1:
        scene1.play(); 
      break;
    case 2:
        scene2.play(); 
      break;
    case 3:
        scene3.play(); 
      break;
    case 4:
        scene4.play(); 
      break;
    case 5:
        scene5.play(); 
      break;
    case 6:
        scene6.play(); 
      break;
    case 7:
        scene7.play(); 
      break;
    case 8:
        outro.play(); 
      break;
  }
}

void stop() {
  // always close Minim audio classes when you finish with them
  song.close();
  minim.stop();
  super.stop();
}
