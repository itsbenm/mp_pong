float leftBatY = 0;
float rightBatY = 0;
int deltaX = 5;
int deltaY = 5;
float ballX = 400;
float ballY = 300;
int leftScore = 0;
int rightScore = 0;
boolean gameOver = false;
boolean[] keys = {false,false,false,false};

void setup() {
  size(800,600);
}

void draw() {
  
  // Drawing the screen
  
  background(0);
  rect(10,leftBatY,10,80);
  rect(width-30,rightBatY,10,80);
  leftTextScore();
  rightTextScore();
  ball();
  centerLine();
  gameEnd();
    
  // Keyboard functions
  
  if(keys[0] && rightBatY>0) rightBatY -= 10;
  if(keys[1] && rightBatY<height-80) rightBatY += 10;
  if(keys[2] && leftBatY>0) leftBatY -= 10;
  if(keys[3] && leftBatY<height-80) leftBatY += 10;
  
  // Collision detection with left bat
  
  if(ballX>=width) {
    deltaX *= -1;
  }
  if(ballY>=height || ballY<=0) {
    deltaY *= -1;
  }
  if(ballX<=20) {
    if(ballY>=leftBatY && ballY<=leftBatY+80) {
      deltaX *= -1;
    }
    else {
      rightScore++;
      ballX = 400;
      ballY = 300;
      int[] xSpeed = {-5, 5};
      deltaX = xSpeed[(int)random(2)];
      int[] ySpeed = {-5,-4,-3,-2,2,3,4,5};
      deltaY = ySpeed[(int)random(ySpeed.length)];
    }
  }
  
  // Collision detection with right bat
  
  if(ballX>=width-40) {
    if(ballY>=rightBatY && ballY<=rightBatY+80) {
      deltaX *= -1;
    }
    else {
      leftScore ++;
      ballX = 400;
      ballY = 300;
      int[] xSpeed = {-5, 5};
      deltaX = xSpeed[(int)random(2)];
      int[] ySpeed = {-5,-4,-3,-2,2,3,4,5};
      deltaY = ySpeed[(int)random(ySpeed.length)];
    }
  }
}

// Player controls

void keyPressed() {
  if(keyCode == UP) keys[0] = true;
  if(keyCode == DOWN) keys[1] = true;
  if(key == 'w' || key == 'W') keys[2] = true;
  if(key == 's' || key == 'S') keys[3] = true;
}

void keyReleased() {
  if(keyCode == UP) keys[0] = false;
  if(keyCode == DOWN) keys[1] = false;
  if(key == 'w' || key == 'W') keys[2] = false;
  if(key == 's' || key == 'S') keys[3] = false;
}

// Game Objects

void ball() {
  ellipse(ballX,ballY,10,10);
  ballX += deltaX;
  ballY += deltaY;
}

void centerLine() {
  stroke(250);
  line(width/2,0,width/2,height);
}

void leftTextScore() {
  textSize(36);
  text(leftScore,width/6,50);
}

void rightTextScore() {
  textSize(36);
  text(rightScore,5*width/6,50);
}

// Restarting the game

void gameEnd() {
  
  // Resets the game
  
  if(gameOver) {
    delay(5000);
    gameOver = false;
    leftScore = 0;
    rightScore = 0;
    ballX = 400;
    ballY = 300;
    int[] xSpeed = {-5, 5};
    deltaX = xSpeed[(int)random(2)];
    int[] ySpeed = {-5,-4,-3,-2,2,3,4,5};
    deltaY = ySpeed[(int)random(ySpeed.length)];
  }
  
  // Checks the score of each player
  
  if(leftScore == 5) {
    background(0);
    textSize(60);
    text("Left Wins",width/3,height/2);
    gameOver = true;
  } 
  if(rightScore == 5) {
    background(0);
    textSize(60);
    text("Right Wins",width/3 - 20,height/2);
    gameOver = true;
  }
}
