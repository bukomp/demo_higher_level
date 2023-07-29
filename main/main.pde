import ddf.minim.*;

Minim minim;
AudioPlayer song;
float[] mainTimeStamps;
int currentMainTimestampIndex = 0;

Intro intro = new Intro();
void setup() {
  size(1280, 720);
  minim = new Minim(this);
  song = minim.loadFile("data/Suspense__BPM156.mp3", 2048);
  song.play();
  
  // Timestamps to trigger different scenes
  mainTimeStamps = new float[] {12.0};
}

void draw() {  

  // if there are no more timestamps, do nothing
  if(currentMainTimestampIndex >= mainTimeStamps.length) {
    return;
  }
  
  // get current song position in seconds
  float songPos = song.position() / 1000.0;
  
  // if the current song position has passed the next timestamp
  if(songPos > mainTimeStamps[currentMainTimestampIndex]) {
    // move on to the next timestamp
    currentMainTimestampIndex++;
  }

  switch (currentMainTimestampIndex) {
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
