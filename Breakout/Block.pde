public class Block{
    private float x, y, w, h;
    private int numBlocks;  //CHANGED FROM EPISODE 3
    private boolean status;
    private int r, g, b;
    
    public Block(){
      x = 0;
      numBlocks = 8;
      y = 0;
      w = width / numBlocks;
      h = 30;
    }
    public Block(int col, int row, int theNumBlocks){
      numBlocks = theNumBlocks;
      w = width / numBlocks;
      h = 30;
      x = w * col;
      y = h * row;
      setColors(row, col);
      status = true;
    }
      
    public void setColors(int col, int row){
        b = 150;
        if(col%9==0){
          r = 50;
        } else if (col%9==1){
          r = 100;
        } else if (col%9==2){
          r = 150;
        } else if (col%9==3){
          r = 200;
        } else if (col%9==4){ 
          r = 250;
        } else if (col%9==5){
          r = 200;
        } else if (col%9==6){
          r = 150;
        } else if (col%9==7){
          r = 100;
        } else if (col%9==8){ 
          r = 50;
        }
        
        if(row%2==0){
          g = 70;
          b = 150;
        }
    }
    public void display(){
      stroke(0);
      strokeWeight(1);
      fill(r/2,g/2,b/2);
      if(status){
        rect(x,y, w, h, 10);
        fill(255,255,0);
        rect(x+8, y+8, w-16, h-16, 2);
        fill(r,g,b);
        rect(x+10, y+10, w-20, h-20, 3);
        
      }
    }
    
    public void checkBall(Ball ball){
       if(status){
         //Bottom
         if(ball.x > x && ball.x < x+w && ball.y < (y+h+ball.d/2)&& ball.y>y+h){
           ball.Vy*=-1;
           status=false;
           score++;
         }
         //Top
         if(ball.x > x && ball.x < x+w && ball.y > y-ball.d/2 && ball.y < y){
           ball.Vy*=-1;
           status=false;
           score++;
         }
         //Left
         if(ball.x > x - ball.d/2 && ball.y > y && ball.y < y+h && ball.x < x){
           ball.Vx*=-1;
           status=false;
           score++;
         }
         //Right
         if(ball.x > x+w  && ball.y > y && ball.y < y+h && ball.x<x+w+ball.d/2){
           ball.Vx*=-1;
           status=false;
           score++;
         }                
       }
      
    }
}
