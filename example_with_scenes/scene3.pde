float x3 = 0;
float y3 = 0;

void scene3() {
    background(0, 0, 255); // Blue background
    fill(255); // White fill color for the rectangle
    rect(x3, y3, 50, 50);
    
    // Update the x and y position of the rectangle
    x3 += 1;
    y3 += 1;
    if (x3 > width || y3 > height) {
        x3 = y3 = 0;
    }
}
