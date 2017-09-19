//this intiger number controls the speed of the circle
final int CIRCLE_SPEED = 7;
//this variable controls the type of color it is going to appear when we pass by a circle and fill the shape in a bluish color.
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
//this variable controls the fill of the color when we click the shape
final color CLICK_FILL_COLOR = color(100, 100, 250);
//this is basically the same as background : (x) - the color is pink 
final color BACKGROUND_COLOR = color(250, 150, 150);
//this indicates the stroke around the circle shapes , same as the background
final color STROKE_COLOR = color(250, 150, 150);
//this indicates the size of the circle and we can change the variable
final int CIRCLE_SIZE = 50;
//I added another function
final int CurrentCircleSize = 5 ;
// the name of the variables
int circleX;
int circleY;
int circleVX;
int circleVY;
//
void setup() {
//size of the window 640x480
  size(640, 480);
  //circleX equals the width divided by two
  circleX = width/2;
  //circleX equals the height divided by two
  circleY = height/2;
  //circleVX equals the circle speed meaning 7
  circleVX = CIRCLE_SPEED;
  //circleVY equals the circle speed meaning 7
  circleVY = CIRCLE_SPEED;
 // we associated the the appearance of the stroke with the variables of STROKE_COLOR
  stroke(STROKE_COLOR);
  // we associated the the appearance of the fill with the variables of NO_CLICK_FILL_COLOR
  fill(NO_CLICK_FILL_COLOR);
  // we associated the the appearance of the background with the variables of BACKGROUND_COLOR
  background(BACKGROUND_COLOR);
}

void draw() {
  //if distance of the cursor on the x,y axes are smaller than CIRCLE_SIZE devided by two the cursor will activate the color blue (fill) inside the circle.
  // what it does is that when the position of the mouse moves near the radius of the Circle it will activate the color.
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  //creates an ellipse in a certain position and size of the circle
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  //the circleX + the circleVX . So the circle width in addition of the circle speed 7
  circleX += circleVX;
  //the circleY + the circleVY . So the circle width in addition of the circle speed 7
  circleY += circleVY;
  //if the circle radius X + circumference /2 (25) , is larger than the width or the circle radius - 25 is smaller than zero.
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    //the circle will move
    circleVX = -circleVX;
  }
  //if the circle radius Y + circumference /2 (25) , is larger than the width or the circle radius - 25 is smaller than zero.
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}
//When you click on the window it will reset the initial background color.
void mousePressed() {
  background(BACKGROUND_COLOR);
}