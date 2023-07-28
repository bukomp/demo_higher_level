float y2 = 0;

void scene2() {
    background(0, 255, 0); // Green background
    stroke(255); // White color for the line
    line(width / 2, y2, width / 2, y2 + 50);
    
    // Update the y position of the line
    y2 += 2;
    if (y2 > height) {
        y2 = 0;
    }
}
