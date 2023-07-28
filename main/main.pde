import ddf.minim.*;

Minim minim;
AudioPlayer song;
float[] timestamps;
int currentTimestampIndex = 0;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  song = minim.loadFile("data/Suspense__BPM156.mp3", 2048);
  song.play();
  
  // replace this with your actual timestamps
  timestamps = new float[] {1.5, 2.3, 4.2, 5.0, 6.7, 7.1, 9.5, 11.0, 12.4, 13.2};
}

void draw() {
  background(0);
  
  // if there are no more timestamps, do nothing
  if(currentTimestampIndex >= timestamps.length) {
    return;
  }
  
  // get current song position in seconds
  float songPos = song.position() / 1000.0;
  
  // if the current song position has passed the next timestamp
  if(songPos > timestamps[currentTimestampIndex]) {
    // trigger a visual event (e.g., change background color)
    background(random(255), random(255), random(255));
    
    // move on to the next timestamp
    currentTimestampIndex++;
  }
}

void stop() {
  // always close Minim audio classes when you finish with them
  song.close();
  minim.stop();
  super.stop();
}
