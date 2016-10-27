int currentX = 0;
int currentY = 0;
int newX;
int newY;
int[] x = {};
int[] y = {};
int randomX;
int randomY;
int chosenX;
int chosenY;
int directionX = 1;
int directionY = 1;
int sizeX = 50;
int sizeY = 50;
int counter = 0;

void setup(){
  size(600, 600);
  background(0);
}

void draw(){
  if (counter < 700){
    createPattern();
  } else if (counter == 700){
    counter = 0;
    background(0);
  }
}

void createPattern(){
  if (currentX >= width || currentX < 0){
      currentX = 0;
      //directionY *= 2;
      currentY = currentY + 50;
      println("currentY: ", currentY);
      y = shorten(y);
      y = shorten(y);
    }
    if (currentY >= height || currentY < 0){
      //currentY = height - 100;
      if (currentY >= height){
        currentY = 0;
        //background(0);
      }else if (currentY < 0){
        currentY = int(random(0, 50)); 
      }
      if (y.length > 0){
        y = shorten(y);
        y = shorten(y);
      }
      println("checkCurrent: ", currentY);
    }
    
    println("directionY: ", directionY);
    newX = currentX + sizeX;
    newY = currentY + sizeY;
    println("newY: ", newY);
    if (x.length <= 1){
      x = append(x, currentX);
      x = append(x, newX);
    }
    if (y.length <= 1){
      y = append(y, currentY);
      y = append(y, newY);
    }
    printArray(x);
    printArray(y);
    randomX = int(random(x.length));
    randomY = int(random(y.length));
    chosenX = x[randomX];
    chosenY = y[randomY];
    stroke(255);
    line(currentX, currentY, chosenX, chosenY);
    currentX = chosenX;
    currentY = chosenY;
    x = shorten(x);
    x = shorten(x);
    counter++;
}