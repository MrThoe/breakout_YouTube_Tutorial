public class Paddle{
   //Variables (x,y, width, height (rectangle))
   private float x, y, w, h;
   
   public Paddle(){
     x = width/2;
     y = height - 60;
     w = 200;
     h = 20;
   }
   
   public void display(){
    
     x = mouseX - w/2;  //CHANGED FROM EPISODE 3
     fill(255,255,0); //
     rect(x-3,y-3,w+6,h+6,8);     
     fill(0,50,100);
     rect(x,y,w,h,8);
     stroke(155,0,55);
     strokeWeight(3);     
     //line(x+3,y+h/2,x+w-3,y+h/2);
     //line(x+w/3, y+2, x+w/3, y+h-2);
     //line(x+2*w/3, y+2, x+2*w/3, y+h-2); 
   }
  
  
}
