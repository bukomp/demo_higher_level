float x1 = 0;

void scene1() {
    background(255, 0, 0); // Red background
    fill(255); // White fill color for the ellipse
    ellipse(x1, height / 2, 50, 50);
    
    // Update the x position of the ellipse
    x1 += 2;
    if (x1 > width) {
        x1 = 0;
    }
}