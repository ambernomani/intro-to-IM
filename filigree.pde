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
int counter = 0;

void setup(){
  size(600, 600);
  background(0);
}

void draw(){
  // set counter to redraw black background - restarts pattern
  if (counter < 700){
    createPattern(50, 50);
  } else if (counter == 700){
    counter = 0;
    background(0);
  }
}



void createPattern(int sizeX, int sizeY){
  //check if the line is complete
  if (currentX >= width || currentX < 0){
      currentX = 0;
      currentY = currentY + 50;
      println("currentY: ", currentY);
      y = shorten(y); // empty array
      y = shorten(y);
    }
    // check if the canvas has been run through
    if (currentY >= height || currentY < 0){
      if (currentY >= height){
        currentY = 0;
      }else if (currentY < 0){
        currentY = int(random(0, 50)); 
      }
      if (y.length > 0){
        y = shorten(y); // empty array
        y = shorten(y);
      }
      println("checkCurrent: ", currentY);
    }
    
    newX = currentX + sizeX;
    newY = currentY + sizeY;
    println("newY: ", newY);
    // create 4 possible locations
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
    // pick random coordinate
    randomX = int(random(x.length));
    randomY = int(random(y.length));
    chosenX = x[randomX];
    chosenY = y[randomY];
    
    // draw line
    stroke(255);
    line(currentX, currentY, chosenX, chosenY);
    currentX = chosenX;
    currentY = chosenY;
    
    x = shorten(x); // empty array
    x = shorten(x);
    
    counter++;
}
