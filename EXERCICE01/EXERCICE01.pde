color bColor = color(255, 255, 255);                            // I added this color 
final int CIRCLE_SPEED = 1;                                     //this intiger number controls the speed of the circle    // slowed down the speed from 7 to 1              
final color NO_CLICK_FILL_COLOR = color(100, 0, 100);         // I changed the no-click_fill-color for green 
final color CLICK_FILL_COLOR = color(150, 200,0);            //this variable controls the type of color it is going to appear when we pass by a circle and fill the shape in a bluish color.
final color BACKGROUND_COLOR = color(200, 250, 8);            // I changed the color for yellow/green
final color STROKE_COLOR = color(00, 255, 150);                //this indicates the stroke around the circle shapes , same as the background //changed the stroke color to a green color.
final int CIRCLE_SIZE = 100;                                     //this indicates the size of the circle and we can change the variable // changed the number from 50 to 100


final int CurrentCircleSize = 5 ;                                //I added another function
int CircleSize = 6 ;

int circleX;                                                    // the name of the variables
int circleY;
int circleVX;
int circleVY;

int rectX;
int rectY ;                                                  
int rectVX;
int rectVY;


void setup() {
  size(640, 300);                                              //size of the window 640x480  //I changed the window size                                
  circleX = width/2;                                           //circleX equals the width divided by two
  circleY = height/2;                                          //circleY equals the height divided by two
  circleVX = CIRCLE_SPEED;                                      //circleVX equals the circle speed meaning 7
  circleVY = CIRCLE_SPEED;
  
   rectX = width/2 ;
   rectY  = height/2 ;                                                
   rectVX = bColor ;
   rectVY = bColor ;
  
  stroke(STROKE_COLOR);                                        // we associated the the appearance of the stroke with the variables of STROKE_COLOR
  fill(NO_CLICK_FILL_COLOR);                                   // we associated the the appearance of the fill with the variables of NO_CLICK_FILL_COLOR
  background(bColor);                                          // we associated the the appearance of the background with the variables of BACKGROUND_COLOR
}



void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {                //if distance of the cursor on the x,y axes are smaller than CIRCLE_SIZE devided by two the cursor will activate the color blue (fill) inside the circle.               
    fill(CLICK_FILL_COLOR);                                                      // what it does is that when the position of the mouse moves near the radius of the Circle it will activate the color.
     
  }
  else {
    fill(200);                                                                    //I changed the NO_CLICK_FILL_COLOR for white.
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CurrentCircleSize);                          //creates an ellipse in a certain position and size of the circle  //I changed CIRCLE_SIZE to CurrentCircle Size                   
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/10 < 0) {         //the circleX + the circleVX . So the circle width in addition of the circle speed 7      
    circleVX = -circleVX;                                                        //the circleY + the circleVY . So the circle width in addition of the circle speed 7       
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {          //if the circle radius X + circumference /2 (25) , is larger than the width or the circle radius - 25 is smaller than zero.     
    circleVY = -circleVY;                                                                  
  }
}

void mousePressed() {
  bColor = color(random(255), random(255), random(255));
  background(bColor);
}