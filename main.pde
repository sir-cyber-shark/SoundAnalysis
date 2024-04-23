/**
 * This sketch is/was modified by Troy Perry, and heavily draws from the
 * Waveform class to "analyze" data-waves. To use it, simply hit command
 * / control + k to open the "sound folder", and put your mp3 into the
 * "data" folder. Additionally, alter the string on line 22. Cheers!
 */

import processing.sound.*;

// Declare the sound source and Waveform analyzer variables
SoundFile sample;
Waveform waveform;

// Define how many samples of the Waveform you want to be able to read at once
int samples = 100;

public void setup() {
  size(640, 360);
  background(255);

  // Load and play a soundfile and loop it.
  sample = new SoundFile(this, "Interzone.mp3");
  sample.loop();

  // Create the Waveform analyzer and connect the playing soundfile to it.
  waveform = new Waveform(this, samples);
  waveform.input(sample);
}

public void draw() {
  // Set background color, noFill and stroke style
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();

  // Perform the analysis
  waveform.analyze();
  
  beginShape();
  for(int i = 0; i < samples; i++){
    // Draw current data of the waveform
    // Each sample in the data array is between -1 and +1 
    vertex(
      map(i, 0, samples, 0, width),
      map(waveform.data[i], -1, 1, 0, height)
    );
  }
  endShape();
}
