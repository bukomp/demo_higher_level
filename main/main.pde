import ddf.minim.*;

int startTime;  // the time at the start
int totalMillis = 60 * 1000;  // total time in milliseconds
String timerText;  // text to display

Intro intro;
Scene1 scene1;
Scene2 scene2;
Scene3 scene3;
Scene4 scene4;
Scene5 scene5;
Scene6 scene6;
Outro outro;

Minim minim;
AudioPlayer song;
SyncManager syncManager;

void setup() {
  size(1920, 1080, P3D);
  fullScreen(P3D);
  minim = new Minim(this);

  intro = new Intro();

  scene1 = new Scene1();
  scene2 = new Scene2();
  scene3 = new Scene3();
  scene4 = new Scene4();
  scene5 = new Scene5();
  scene6 = new Scene6();

  outro = new Outro();
  
  textAlign(RIGHT, TOP);  // align text to top right
  textSize(50);  // large timer text
  startTime = millis();  // store the start time

  syncManager = new SyncManager();
  song = minim.loadFile("data/Suspense__BPM156.mp3", 2048);
  song.play();
}

void drawTimer() {
  int timeRemaining = totalMillis - (millis() - startTime);  // calculate remaining time
  int seconds = timeRemaining / 1000;  // calculate seconds
  int millisec = timeRemaining % 1000;  // calculate milliseconds

  // format the time as ss:ms
  textAlign(RIGHT, TOP);  // align text to top right
  textSize(50);  // large timer text
  timerText = "df:hl:"+nf(seconds, 2) + ":" + nf(millisec, 3);
  fill(255);
  // display the timer text in the top right corner
  text(timerText, width - 20, 10);

  // stop the program when the time is up
  if (timeRemaining <= 0) {
    noLoop();
  }
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
        scene5.play(); 
      break;
    case 3:
        scene3.play(); 
      break;
    case 4:
        scene4.play(); 
      break;
    case 5:
        scene2.play(); 
      break;
    case 6:
        scene6.play(); 
      break;
    case 7:
        outro.play(); 
      break;
  }
  
  drawTimer();
}

void stop() {
  // always close Minim audio classes when you finish with them
  song.close();
  minim.stop();
  super.stop();
}
