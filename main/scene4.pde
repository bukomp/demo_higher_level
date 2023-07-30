float speed = 0.01f;

class Scene4 {
  boolean gridVisible;
  float[] timestamps;
  int currentTimestampIndex;
  TextMover textmove;


Planet[] planets = new Planet[400]; 
PVector spaceship;




  Scene4() {
    this.gridVisible = false;
    this.timestamps = new float[] {}; 
    this.currentTimestampIndex = 0;
      spaceship = new PVector(0, 0, 2000);
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(random(-1200, 2500), random(-1200, 2500), random(-8000, 0));
  }
  noStroke(); // Remove outlines
  textmove = new TextMover();
  
  }

  boolean timestampHandled = false;
  void play() {
    float scenePos = syncManager.getCurrentScenePosition();
background(0, 100, 100);
    background(color(unhex("ED"), unhex("18"), unhex("BF")));
  lights();

  spaceship.z += speed;
  speed += 0.2;
  
  for (Planet p : planets) {
    p.display();
    p.update();
  }
  
  textmove.update();
  textmove.display();
  }
}

class TextMover {
float angle;
  PVector location;

  //constr
  TextMover() {
    location = new PVector(width/2, height/2);
  } //constr

  void update() {
    location.y = 400 * cos (angle) + height/2;
    angle+=0.2;
  }

  void display() {
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("==================================================================================== HIGHER, HIGHER ====================================================================================", location.x, location.y);
  }
}

class Planet { // a planet with position, size and color
  PVector pos;
  float size;
  color c;

Planet(){
    // No stroke on the circles
}
color[] colors = {
  color(unhex("42"), unhex("11"), unhex("ED")),
  color(unhex("12"), unhex("F4"), unhex("EB")),
  color(unhex("FE"), unhex("EA"), unhex("4E"))
};

  Planet(float x, float y, float z) {
    pos = new PVector(x, y, z);
    size = random(50, 150); // Planets are of different sizes
    c = colors[(int)random(colors.length)];
  }

  void display() { // draws the planet
    pushMatrix();
    noStroke();
    translate(pos.x, pos.y, pos.z);
    fill(c, 95);
    sphere(size);
    popMatrix();
  }

  void update() { // moves the planet
    pos.z += speed;
  }
}