// General "what it does" : when the cube touches or reaches the rectangle at the bottom it sends a messages to bounce back , instead of going through ... \
// the rectangle covers a small area , so it moves along with the mouse and moves the rectangle/ bar from the bottom.
// the square loops and moves ramdonly 

//Properties
color backgroundColor = color(255);
// this gives a noise background effect.
int numStatic = 1000;
// this changes the size if the rectangle or shape of the STATIC effect.
int staticSizeMin = 5;
int staticSizeMax = 20;
color staticColor = color(0,150,0);
PImage sMiley = loadImage ("https://upload.wikimedia.org/wikipedia/en/1/12/Yellow_Smiley_Face.png");

//these are the properties of the paddle
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 20;
int paddleWidth = 200;
int paddleHeight = 16;
color paddleColor = color(0,255,0);

//these are the properties of the ball
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 3;
int ballSize = 16;
color ballColor = color(255);


//this set up the 2 functions
void setup() {
  size(640, 480);

  setupPaddle();
  setupBall();
}


// this setup the paddle at the bottom _center
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

// this setup the start of the ball at the center of the display
void setupBall() {
  ballX = width/2 ;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}
// this function 
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    rect(x, y, staticSize, staticSize);
    
  }
}

void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2);
}

void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}

boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}
// this is the bounce effect : when the ball hit the wall at it's extremities it will bounce_back.
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

// when the key left or right is pressed the paddle will increase its speed in the left or right direction
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

// when the key left or right is Released the paddle will stop moving
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}