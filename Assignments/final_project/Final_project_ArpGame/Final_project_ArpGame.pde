// december 8th issues , when I added the sound reactive features , I seeems to respond well . 
//When it starts running , it runs fine I can control my metaball repulsion by the mouse hold/click
//But the more the music continues the less I can control the shapes with the mouse , It seems like the 
//the sound has taken control completely of the movement of the metaballs ,I cannot use the mouse click any more.
//the they seem to tend to go to the bottom right all the time



import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;  
AudioPlayer meditative;
FFT fftLin;
FFT fftLog;

//This shapes that I did are based on the tutorial I found at:
 //https://www.youtube.com/watch?v=ccYLb7cLB1I (Metaballs and blobs explained by daniel shiffman)
 
 //Controls:
 
 //- Use number keys 1 to 4 to change the display.
// - Click and hold the mouse button amongst the blobs to make them scatter.

final int RADIUS_NUM = 100 ;
final int NUM_BALLS = 6;
PVector[] mbPos = new PVector[NUM_BALLS];
PVector[] mbVel = new PVector[NUM_BALLS];
float[] mbRadius = new float[RADIUS_NUM];
float sum = 0.5;
final float FRICTION = 0.999;

// for this part the final its not longer there because we want to use this MOUSE REPEL and COHESION WEIGHT (attraction to the center) later on
//if we ever wanted to use these other values or modify them according to the sound , we would need to take off the final
// Ideas : to obtain more movement according to the sound , or make sound reactive vectors/shapes:
// Change the MAX_VEL or the THRESH or FRICTION ABOVE....

 final float MOUSE_REPEL = 100000;
final float MAX_VEL = 100;
 float COHESION_WEIGHT = 0.05;
final float THRESH_1 = 5; 
final float THRESH_2 = 5.5;
final float THRESH_3 = 5;
final float THRESH_4 = 7;
PVector u = new PVector();
PVector m = new PVector();
PVector c = new PVector();
PVector repel = new PVector();
float mDistance;
PVector centre = new PVector(random(50),random(50),random(255));

//MAP OF values we get by the frequency
float spectrumScale = 0.5;

void setup() {
  colorMode(HSB,360,100,100);
  size(600, 800, P2D);
  for(int i=0; i< NUM_BALLS; i++) {
    mbPos[i] = new PVector(random(0,width),random(0,height));
    mbVel[i] = new PVector(random(-1,1),random(-1,1));
    mbRadius[i] = random(10,200);
  }
  
  //SOUND PART // load the files
    minim = new Minim(this);
  meditative = minim.loadFile("meditative.mp3", 1024);
  fftLin = new FFT( meditative.bufferSize(), meditative.sampleRate() );
  meditative.play();
  
  frameRate(24);
}


void draw() {
  
  //in this part the vector changes according to the sound frequency
  
  fftLin.forward( meditative.mix );
  float averageSample =0;
  for(int i = 0; i < fftLin.specSize(); i++)
    {
      
     averageSample+=fftLin.getBand(i)*spectrumScale;
     // line(i, height/3, i, height/3 - fftLin.getBand(i)*spectrumScale);
    }
     averageSample = averageSample/ fftLin.specSize();
     println(averageSample);
     
     
     
     ///////
     
     /// this part we say that the cohesion weight aka the balls will move towards the center according to
     //the values that we are getting in the averageSample of the sound FFT frequency.
    // COHESION_WEIGHT = averageSample;
    // THRESH_4 = averageSample;
    
    
   //////////
    
  //println(frameRate);
  
  //update meta ball positions
  for(int i=0;i<NUM_BALLS;i++) {
    //mouse?
    if(mousePressed) {
      m.set(mouseX,mouseY,0);
      mDistance = PVector.dist(mbPos[i],m);
      repel = PVector.sub(mbPos[i],m);
      repel.normalize();
      repel.mult(MOUSE_REPEL/(mDistance*mDistance));
      mbVel[i].add(repel);
    }

    centre.add(mbPos[i]);

    mbVel[i].mult(FRICTION);

    mbVel[i].limit(MAX_VEL);
  }

  centre.div(NUM_BALLS);
  
  ///added but might not be necesary
  ///centre.mult(NUM_BALLS);

  for(int i=0;i<NUM_BALLS;i++) {

    //tendancy to go to centre
    c = PVector.sub(centre,mbPos[i]);
    c.normalize();
    c.mult(COHESION_WEIGHT);
    mbVel[i].add(c);

    mbPos[i].add(mbVel[i]);

    //bounce effect
    if(mbPos[i].x > width) {
      mbPos[i].x = width;
      mbVel[i].x *= -1.0;
    }
    if(mbPos[i].x < 0) {
      mbPos[i].x = 0;
      mbVel[i].x *= -1.0;
    }
    if(mbPos[i].y > height) {
      mbPos[i].y = height;
      mbVel[i].y *= -1.0;
    }
    if(mbPos[i].y < 0) {
      mbPos[i].y = 0;
      mbVel[i].y *= -1.0;
    }
  }
  //draw stuff
  background(random(255,255));
  for(int i=0; i<width; i++) {
    for(int j=0; j<height; j++) {
      sum = 0; 
      for(int m=0; m<NUM_BALLS; m++) {
        sum += mbRadius[m] / sqrt(sq(i-mbPos[m].x) + sq(j-mbPos[m].y));
      }
      
      ///////keys 1 ,2, 3, 4 : used to change in different modes of display 
      
      /////
      switch(key) {
      case '4':
        //random colors
        if(sum >= THRESH_1 && sum <= THRESH_2) {
          set(i,j,color(155,100,62)); //chose color
        }
        else if(sum > THRESH_2 && sum <= THRESH_3) {
          set(i,j,color(0,noise(255),random(100))); //chose color or make it random 
        }
        else if( sum > THRESH_3 && sum <= THRESH_4) {
          set(i,j,color(random(200),random(200),random(96))); //chose color or make it random
        }
        break;
      case '3':
        //Psychadelic
        set(i,j,color(sum*sum*sum/10,100,255));
        break;
      case '2':
        //White
        set(i,j,color(200,255,sum*sum*sum/2));
        break;
      case '1':
      default : 
        //Red      
        set(i,j,color(200,5,(sum*sum*sum)/4));
        break;
      }
    }
  }
}