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
}

void draw() {
  intro();
}

void stop() {
  // always close Minim audio classes when you finish with them
  song.close();
  minim.stop();
  super.stop();
}
