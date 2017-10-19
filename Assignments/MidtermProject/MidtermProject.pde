////-------------

// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
//Ideas of scoring : I can add printed numbers on the window each time the ball scapes the paddle (scores) ///
//SO addition of numbers and println ??
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)
//----------------------------------------------
// Global variables for the paddles and the ball
//----------------------------------------------
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
Gameover gameover;

//---------------------------------
// TEXT : font variable (declare)
//----------------------------------
PFont f ;

//-------------------------------------------------------------
// The distance from the edge of the window a paddle should be
//--------------------------------------------------------------
int PADDLE_INSET = 8;

//-------------------------------------------
// The background colour during play (black)
//-------------------------------------------
color backgroundColor = color(255,0,0);
int startTimeMs;


//-------------------------------------------------
// The time until the game starts, in milliseconds
// (easy to convert to seconds, sec = ms/1000)
//------------------------------------------------
 final int startDelayMs = 3000;
 boolean atStartup = true;
  
 String displayname;

//--------------------------------------------------
// setup()
////void setup() {
 
// Sets the size and creates the paddles and ball //sets up the fonts :
//------------------------------------------------------------------------
void setup() {
  
  //------------------
  // Set the size
  //------------------
  size(750, 750);
  
  //------------------------------
  // Current time, in milliseconds
  //------------------------------
 startTimeMs = millis();
 
//--------------------------------------------------------------------------------
  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  //----------------------------------------------------------------------------------------
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');
  
  //----------------------------------------------
  // Create the ball at the centre of the screen
  //----------------------------------------------
  ball = new Ball(width/2, height/2);
  
  //-----------------------------------
  /// TEXT
   //size (10,10);
   //--------------------------------
  f= createFont("Arial",16,true); 
  
  
}



//---------------------------------------------------------------------
// draw()
/// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.
//---------------------------------------------------------------------

void draw() {
  
 
   if (atStartup) {
     //----------------------------------
     // The current time, in milliseconds
     //----------------------------------
     int curTimeMs = millis();
     //-----------------------------------------
     // The remaining time in the startup period
     //-----------------------------------------
     int startupTimeRemainingMs = startDelayMs - (curTimeMs - startTimeMs);
     startScreen(startupTimeRemainingMs);
     atStartup = startupTimeRemainingMs > 0;
     //--------------------------------------------------
     // Short-circuit if we're still in the startup phase.
     //---------------------------------------------------
     return;
   }
    background(0);
   fill(240);
   textAlign(CENTER,CENTER);
   text("GO!", 750/2, 750/2);
   
 
 //-----------------------------------------------------------------------------
 //end of timer
 
    // Fill the background each frame so we have animation
 //background(backgroundColor);
  
 // FONT: Specify font to be used , then specify font color , then display text
  //textFont(f,16);
  //fill(255);
  
  //text("Start PONG Game!",width/2,height/2);
  
  //--------------------------------------------


  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen())  {
    // If it has, reset the ball
    ball.reset();
    //the scores is always changing when the ball goes off the screen 
    ball.score = ball.score -1;
    // ball.reset();
    
  //WORKS  : if the numbers of the scores are hits the 0 , reset the ball and the score track.
  if (ball.score < 0)
   ball.resetScore();
   
  // gameover.display_gameover_message();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
}

void startScreen(int remainingTimeMs){
   background(50);
   textSize(100);
   fill(0);
   textAlign(CENTER,CENTER);
   // Show the remaining time, in seconds;
   // show n when there are n or fewer seconds remaining. 
   text(ceil(remainingTimeMs/1000.0),750/2, 750/2);
 } 


// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}