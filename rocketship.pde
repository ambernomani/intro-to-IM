PImage fire1;
PImage fire2;

int speed = 7;
int counter = 0;

Star s1;
int numStars = 40;
Star[] stars = new Star[numStars]; // create array


void setup(){
  size(800, 800);
  fire1 = loadImage("fire1.png");
  fire2 = loadImage("fire2.png");
  background(0);
  noStroke();
  for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
    s1 = new Star();
  }
}

void draw(){
  fill(0,80); // (color black, alpha)
  rect(0,0, width, height); // create rectangle for background
  
  for (int i = 0; i < stars.length; i++) {
    if (keyPressed == true){
        speed = 7;
        if (counter % 10 > 5) {
          image(fire1, 460, 340);}
        else { 
          image(fire2, 460, 340);}
    }else {
        speed = 1;
    }
    stars[i].fall();
    print(speed);
  }
  counter++;
  
  rocket();    
  
}




class Star {
  float s = random(width);
  float y = random(height);
  
  void fall(){
    y = y + speed;
    s = s + speed * 1.75;
    fill(255);
    ellipse(s, y, 15, 10);
    
   if (y > height){
   s = random(width);
   y = random(height);
    }
  }
}
 
void rocket(){
  stroke(0);
  fill(255, 0, 0);
  triangle(200, 200, 250, 300, 310, 200);
  fill(255);
  quad(250, 300, 310, 200, 500, 315, 440, 418);
  fill(255, 0, 0);
  triangle(300, 331, 440, 460, 440, 418);
  triangle(350, 224, 500, 315, 540, 300);
  quad(340, 290, 480, 350, 500, 380, 460, 380);
}