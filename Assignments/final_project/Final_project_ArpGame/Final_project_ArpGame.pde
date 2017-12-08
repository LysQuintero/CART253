import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;  
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;

//This shapes that I did are based on the tutorial I found at:
 //https://www.youtube.com/watch?v=ccYLb7cLB1I (Metaballs and blobs explained by daniel shiffman)
 
 //Controls:
 
 //- Use number keys 1 to 4 to change the display.
// - Click and hold the mouse button amongst the blobs to make them scatter.


final int NUM_BALLS = 10;
PVector[] mbPos = new PVector[NUM_BALLS];
PVector[] mbVel = new PVector[NUM_BALLS];
float[] mbRadius = new float[NUM_BALLS];
float sum = 0.0;
final float FRICTION = 0.999;
 float MOUSE_REPEL =100;
final float MAX_VEL = 15;
 float COHESION_WEIGHT = 0.05;
final float THRESH_1 = 5; 
final float THRESH_2 = 5.5;
final float THRESH_3 = 6;
final float THRESH_4 = 7;
PVector u = new PVector();
PVector m = new PVector();
PVector c = new PVector();
PVector repel = new PVector();
float mDistance;
PVector centre = new PVector(0,0);
float spectrumScale =1;