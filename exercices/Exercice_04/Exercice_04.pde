// Griddies
// by Pippin Barr
// MODIFIED BY: Lys Quintero

//-----------------------------------------------------------------------
//idea 01 : of modification :  This one will have all the same features , 
//the only thing is that the life continues after the death of the griddies . 
//So it means that when one griddie or squarie disappears another species surges . 
//And this one will be the “ roundies “ , those species will the over the last species . 
//They will have the same behavior , but some of them will reproduce in big /larges quandtities (compared to the griddies). 
//And also the will be the option to make explode some “roundies” if they obtain too much energy ( so the will be an energy limit). 
//The option if the roundies and griddies overlap they explode( or divide in more pieces , basically making more babies)
//----------------------------------------------------------------------------------------------------------------------------------
//idea 02 : simplified exercise : this time the griddies interact with the roundies . Sadly ,this time , the roundies murder the griddies 
//---------------------------------
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.
//-------------------------------------------

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  // A: this LOOP is used to repeat numbers in random position, if the number is less than the //
  //"griddies array length” then you have to create a new Griddie in a random location. // while passing the values to the class.///
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
  
  // the loop for Roundie : ---------------------
  
  for (int k = 0 ; k < roundies. lenght ; k++) {
    int x = floor(random(0, width /roundSize)0 ;
    int y = floor (random (0 , height / roundSize)) ;
    roundies [k] = new Roundie (x2 * roundSize , y * roundSize , roundSize);
    
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(200,255,200,50);

for (int k = 0 ; k < roundies.length ; k ++ ) {
  roundies[k].update();
  roundies[k].display();
  for(int j = 0 ; j < griddies.length ; j

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
     // A: it checks if the griddies (j) equals to the opposite (i) // so if its on the opposite it will reacts , otherwise if it's the same ...//
     // let say "i" touches "i" , it doesn't react as the opposite.
      if (j != i) {
        // QUESTION: What does this line check?
        //A : A:  this parts seems to call the collide for griddie (j) , it depends on which array…
        griddies[i].collide(griddies[j]);
      }
    }
    
    // Display the griddies
    griddies[i].display();
  }
}