class Scene5 {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;

int a=width; //sketch size
float s=5; //length of line
float x, y; //start of line
int j = 0; //first "wipe"
int k = -500; //second "wipe" 


  Scene5() {
    this.gridVisible = false;
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;
  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
    float scenePosNormalised = syncManager.getCurrentScenePositionNormalized();

    if(scenePosNormalised > 0.999999999){
      song.unmute();
    }else if(scenePosNormalised> 0.00000001){
      song.mute();
      noStroke();
    }
    for (int i=0;i<=0.5*a;i++) {
      stroke(random(0,255));
      x = random(0,a);
      y = random(0,a);
      line(x,y,x+random(0,s),y);
  }
  stroke(100,100);
  line(000000.1,j,a,j);
  j++;
  if (j>a) {
    j=0;
  }
  stroke(100,100);
  line(000000.1,k,a,k);
  k++;
  if (k>a) {
    k=0;
  }
  }
}
