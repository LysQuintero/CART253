/////MODIFIES LOCATIONS FROM WHICH SHAPES ARE DRAWN
//PShape bot 

//void setup() {
  //size(100, 100);
  //bot = loadShape("bot.svg");
//}

//void draw() {
  //shapeMode(CENTER);
  //shape(bot, 35, 35, 50, 50);
 // shapeMode(CORNER);
  //shape(bot, 35, 35, 50, 50);
//}



PShape a;
PShape b ;
PShape c ;
PShape d ;
PShape e ;

// Import the sound library
import processing.sound.*;

// A sound file object
SoundFile dingdong;
SoundFile punchie ;
SoundFile heartbeatie ;

// A doorbell object (that will trigger the sound)
Doorbell doorbell;

/////
Punch punch ;

//
Hbeat hbeat ;

//

//Hand hand ;

void setup() {
  size(800, 600);
  
  a = loadShape("01.svg");
  b = loadShape("02.svg");
  c = loadShape("03.svg");
  d = loadShape("04.svg");
  e = loadShape("05.svg");

  // Create a new doorbell
  doorbell = new Doorbell(width/2, height/2, 64, "doorbell.mp3", this);
//

 punch = new Punch(width/2, height/3, 20, "punch.mp3", this);
 
 hbeat = new Hbeat(width/2, height/4, 20, "hbeat.mp3", this);
}

void draw() {
  background(255);
  // Show the doorbell
  doorbell.display(mouseX, mouseY);
  punch.display(mouseX , mouseY);
  hbeat.display(mouseX ,mouseY) ;
  
  //show the PShape(s)
  
  shape(a, mouseX, mouseY ,100,100);  // Draw at coordinate (110, 90) at size 100 x 100
  shape(b, 100,600,100,100);            // Draw at coordinate (280, 40) at the default size
  shape(c ,500,200,100,100);
  shape(d ,125,200,100,100);
  shape(e ,50 ,20,100,100);

}
  


void mousePressed() {;
  // If the user clicks on the doorbell, play the sound!
  if (doorbell.contains(mouseX, mouseY)) {
    doorbell.ring();
  } 
  
 else if(hbeat.contains(mouseX,mouseY)) {
 hbeat.ring(); 
  
 } 
    if (punch.contains(mouseX, mouseY)) {
      punch.ring();
      
  }
  
  //if (shape e contains (mouseX, mouseY)) {
    
  
}