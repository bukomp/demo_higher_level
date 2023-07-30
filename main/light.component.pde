class LightSource {
  float x, y; // position of the light source
  color c; // color of the light source
  int glowSize; // size of the glow effect

  // constructor
  LightSource(float _x, float _y, color _c, int _glowSize) {
    x = _x;
    y = _y;
    c = _c;
    glowSize = _glowSize;
  }

  // display method to draw the light source
  void display() {
    // create the glow effect
    for (int i = glowSize; i > 0; i--) {
      float factor = map(i, 0, glowSize, 0, 255);
      fill(red(c), green(c), blue(c), factor);
      ellipse(x, y, i, i);
    }
  }
}