Ball ball;
Paddle paddle;
Block[][] block;
int rows, columns, score, lives, level;

void setup(){
  size(1000,700);
  textSize(24);
  level = 0;
  score=0;
  lives = 3;  
  rows = 4;
  columns = 8;
  makeLevel(columns, rows);
}

void draw(){
  background(0);
  ball.display();
  ball.checkPaddle(paddle);
  paddle.display();
  showBlocks(); 
  showLives();
  showScore();
  checkLevel();
}

void checkLevel(){
  if(clearBlocks()){
    level++;
    ball.canMove = false;
    ball.y = paddle.y - ball.d/2;
    fill(0);
    rect(190, height/2 + 130, 400, 30);
    rect(250, height/2 + 160, 400, 30);    
    fill(255,0,255);  
    text("Tu has limpiado todos los bloques" , 200, height/2+152);
    text("Click para continuar" , 260, height/2+182); 
    if(mousePressed){
      if(level%2==0){
        rows *= 2;
      } else {
        columns *= 2;
      }
      makeLevel(rows, columns);   
      ball.canMove = true;
    }
  }
}

void showScore(){
  strokeWeight(2);
  fill(255,0,255);
  text("Marcador: " + score, width - 140, height - 10); 
}
void showLives(){
  fill(255,0,255);  
  text("Vidas: " + lives, 40, height - 10);  
  if(lives == 0){
    fill(0);
    rect(190, height/2 + 130, 400, 30);
    rect(250, height/2 + 160, 400, 30);    
    fill(255,0,255);  
    text("Game over" , 200, height/2+152);
    text("Da click para continuar" , 260, height/2+182);    
  }
}

void showBlocks(){
  for(int i = 0; i < block.length; i++){
    for(int j = 0; j < block[0].length; j++){
      block[i][j].display();
      block[i][j].checkBall(ball);
    }
  }  
}

void makeLevel(int rows, int columns){
  ball = new Ball();
  paddle = new Paddle();
  block = new Block[rows][columns];
  for(int i = 0; i < block.length; i++){
    for(int j = 0; j < block[0].length; j++){
      block[i][j] = new Block(i,j+5,block.length);
    }
  }  
}

boolean clearBlocks(){
  for(int i = 0; i < block.length; i++){
    for(int j = 0; j < block[0].length; j++){
      if(block[i][j].status){
        return false;  
      }
    }
  }
  return true;
}

void mousePressed(){
  if(lives > 0){
    ball.y -= 5;
    ball.canMove = true; 
  } else {
    setup();
  }
}
