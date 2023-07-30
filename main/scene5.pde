class Scene5 {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;
  TextLine noscene;
  TextLine noscene2;


  int a=width; //sketch size
  float s=5; //length of line
  float x, y; //start of line
  int j = 0; //first "wipe"
  int k = -500; //second "wipe" 


  Scene5() {
    this.gridVisible = false;
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;
    this.noscene = new TextLine(height/8, 0, width/2, height/2-height/16-25, color(255), "[ scene missing ]");
    this.noscene2 = new TextLine(height/20, 0, width/2, height/2+height/16, color(255), "Or is it? :D");

  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
    float scenePosNormalised = syncManager.getCurrentScenePositionNormalized();



    if(scenePosNormalised > 0.9){
      song.unmute();
    }else if(scenePosNormalised> 0.00000001){
      song.mute();
      noStroke();      
      background(0);

      this.noscene.display();
      //this.noscene2.display();


      for (int i=0;i<=0.5*a;i++) {
        stroke(random(0,255));
        x = random(0,a);
        y = random(0,a);
        line(x+0.0000001,y,x+random(0,s),y);
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
}
