final int CIRCLE_SPEED = 7;                                     //this intiger number controls the speed of the circle                  
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);         //this variable controls the type of color it is going to appear when we pass by a circle and fill the shape in a bluish color. 
final color CLICK_FILL_COLOR = color(100, 100, 250);            //this variable controls the type of color it is going to appear when we pass by a circle and fill the shape in a bluish color.
final color BACKGROUND_COLOR = color(250, 150, 150);            //this is basically the same as background : (x) - the color is pink 
final color STROKE_COLOR = color(250, 150, 150);                //this indicates the stroke around the circle shapes , same as the background
final int CIRCLE_SIZE = 50;                                     //this indicates the size of the circle and we can change the variable


final int CurrentCircleSize = 5 ;                                //I added another function
int CircleSize = 6 ;

int circleX;                                                    // the name of the variables
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(640, 480);                                              //size of the window 640x480                                  
  circleX = width/2;                                           //circleX equals the width divided by two
  circleY = height/2;                                          //circleY equals the height divided by two
  circleVX = CIRCLE_SPEED;                                      //circleVX equals the circle speed meaning 7
  circleVY = CIRCLE_SPEED;                                     //circleVY equals the circle speed meaning 7
  stroke(STROKE_COLOR);                                        // we associated the the appearance of the stroke with the variables of STROKE_COLOR
  fill(NO_CLICK_FILL_COLOR);                                   // we associated the the appearance of the fill with the variables of NO_CLICK_FILL_COLOR
  background(BACKGROUND_COLOR);                                // we associated the the appearance of the background with the variables of BACKGROUND_COLOR
}

void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {                //if distance of the cursor on the x,y axes are smaller than CIRCLE_SIZE devided by two the cursor will activate the color blue (fill) inside the circle.               
    fill(CLICK_FILL_COLOR);                                                      // what it does is that when the position of the mouse moves near the radius of the Circle it will activate the color.
     
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CurrentCircleSize);                          //creates an ellipse in a certain position and size of the circle  //I changed CIRCLE_SIZE to CurrentCircle Size                   
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {         //the circleX + the circleVX . So the circle width in addition of the circle speed 7      
    circleVX = -circleVX;                                                        //the circleY + the circleVY . So the circle width in addition of the circle speed 7       
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {          //if the circle radius X + circumference /2 (25) , is larger than the width or the circle radius - 25 is smaller than zero.     
    circleVY = -circleVY;                                                                  
  }
}

void mousePressed() {                                                            //When you click on the window it will reset the initial background color.          
  background(BACKGROUND_COLOR);
}