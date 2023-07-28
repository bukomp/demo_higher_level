void setup() {
    size(500, 500);
}

void draw() {
    int time = millis() / 1000;  // get current time in seconds

    if (time < 5) {
        scene1();
    } else if (time < 10) {
        scene2();
    } else if (time < 15) {
        scene3();
    } else {
        // After 15 seconds, loop back to the first scene
        setup();
    }
}