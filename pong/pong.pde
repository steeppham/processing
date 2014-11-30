// Pong Game
// Stephen Pham
// 30/11/14
// Based on http://drdoane.com/thinking-through-a-basic-pong-game-in-processing/

float ballX = 20;
float ballY = 20;
float dx = 2;
float dy = 2;
float paddleX;
float paddleY = 10;
float paddleH = 30;

void setup() { 
  size(400, 400);
  paddleX = width - 15;
}

void draw() {
  // Refresh background
  background(255, 255, 255);
  // Draw ball
  ellipse(ballX, ballY, 20, 20);
  // Draw paddle
  rect(paddleX, paddleY, 10, paddleH);
  
  // Check paddle collision
  if (collision()) {
   dx = -dx; 
  }
  
  // Reverse direction if past right side
  if (ballX > width || ballX < 0) {
    dx = -dx;
  } 
  
  if (ballY > height || ballY < 0) {
    dy = -dy;
  }
  
  ballX += dx;
  ballY += dy;
  
  
}

boolean collision() {
  return (ballX > paddleX) && (ballY >= paddleY) && (ballY <= paddleY + paddleH);
}

void keyPressed() {
 if (key == CODED) {
  if (keyCode == UP) {
   paddleY -= paddleH;
  } else if (keyCode == DOWN) {
    paddleY += paddleH;
  }
 }
}
  

