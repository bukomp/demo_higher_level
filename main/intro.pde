// Global variables to store the current timestamp and highlight
float currentTime = 0.0;
color currentColor = color(0, 0, 0);
color nextColor = color(0, 0, 0);
int nextTimestampIndex = 0;

void intro() {
  // Arrays to store the timestamps and highlights
  float[] timestamps = { 0.412, 1.375, 2.336, 3.103, 3.296, 3.489, 4.26, 4.453, 4.642, 5.413, 6.181, 6.372, 6.567, 6.848, 7.529, 7.724, 7.91, 8.101, 8.876, 9.061, 9.26, 9.45, 9.643, 9.926, 10.121, 10.414, 10.606, 10.8, 10.988, 11.181, 11.469, 11.567, 11.661, 12.136 };
  String[] highlights = { "neonPink", "neonBlue", "neonPink", "neonGreen", "neonGreen", "neonGreen", "neonBlue", "neonBlue", "neonBlue", "neonPink", "neonGreen", "neonGreen", "neonGreen", "neonPink", "neonGreen", "neonGreen", "neonGreen", "neonPink", "neonGreen", "neonGreen", "neonGreen", "neonBlue", "neonPink", "neonGreen", "neonGreen", "neonGreen", "neonGreen", "neonGreen", "neonGreen", "neonGreen", "neonGreen", "neonGreen", "neonGreen", "neonPink" };
  
  // Maps for highlights to colors
  color[] highlightColors = { color(255, 0, 255), color(0, 255, 255), color(0, 255, 0) };

  // Update the current timestamp
  currentTime += 1.0/frameRate;

  // Check if the current time has passed the next timestamp
  if (nextTimestampIndex < timestamps.length && currentTime >= timestamps[nextTimestampIndex]) {
    // If it has, update the current color and the next color, and increment the index of the next timestamp
    currentColor = nextColor;
    if (highlights[nextTimestampIndex].equals("neonPink")) {
      nextColor = highlightColors[0];
    } else if (highlights[nextTimestampIndex].equals("neonBlue")) {
      nextColor = highlightColors[1];
    } else if (highlights[nextTimestampIndex].equals("neonGreen")) {
      nextColor = highlightColors[2];
    }
    nextTimestampIndex++;
  }

  // Calculate the lerp value (how far we are between the current timestamp and the next timestamp)
  float lerpVal;
  if (nextTimestampIndex >= timestamps.length) {
    lerpVal = 1.0; // If we're past the last timestamp, just stay at the final color
  } else if (nextTimestampIndex == 0) {
    lerpVal = map(currentTime, 0, timestamps[0], 0, 1);
  } else {
    lerpVal = map(currentTime, timestamps[nextTimestampIndex-1], timestamps[nextTimestampIndex], 0, 1);
  }

  // Get the interpolated color
  color interpColor = lerpColor(currentColor, nextColor, lerpVal);

  // Set the background to the interpolated color
  background(interpColor);
}
