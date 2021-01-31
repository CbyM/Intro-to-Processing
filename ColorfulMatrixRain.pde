//Ball variables
float cx, cy, radius=50;
// Grabbed
boolean grab = false;
// Calculate Ball position offset
float xOffset = 0.0; 
float yOffset = 0.0; 
// Calculate seconds passed
int time=0;
int tt;
// Initial y position
int y = -800;
// width and height
int sizeX = 800;
int sizeY = 800;
// maximum amount of columns. Multiples of 2 are better.
int max_numColumns = 1024;
int numColumns = floor(random(1, max_numColumns)); // randomize total num of columns to be created for each loop
int[] xPosi;   // array to store random initial x positions
int[] yPosiOffset; // array to store random initial y position offset
//font
PFont f; 

///Functions///
void mousePressed() {
  grab = true;
  if (grab == false) {
    xOffset = mouseX-cx; 
    yOffset = mouseY-cy;
  }
}

void mouseDragged() {
  if (grab == true) {
    cx = mouseX-xOffset; 
    cy = mouseY-yOffset; 
    colors();
  }
}

void mouseReleased() {
  grab = false;
}

void colors() {
  float r=floor(random(0, 255));
  float g=floor(random(0, 255));
  float b=floor(random(0, 255));
  fill(r, g, b);
}

void ballFall() {
  if (grab != true && mousePressed == false) {
    cy +=7.5;
    if (cy >= height - 50) {
      cy = height - 50;
    }
  }
}

//Ball enhales and exales every 3 seconds and increases size
void ballBreath() {
  if (tt % 3 == 0) {
    radius+=0.3;
  } else {
    radius -=0.1;
  }
}

// Matrix effect
void matrixRain() {

  for (int i=0; i<numColumns; i++) {
    int randomChar = floor(random(255)); // random number between 0-254 for Unicode
    char letter = char(randomChar); //turn Unicode decimal into a character
    text(letter, xPosi[i], y+yPosiOffset[i]); // print character in the screen at x and y coordinates
  }

  // if y is out of the screen, respawn back to pos -800 and reassign arrays to random values for each iteration
  // which also produces different number of columns.
  y = y + 2;

  if (y>sizeY*2) { 
    y = -800;
    numColumns = floor(random(1, max_numColumns)); 
    xPosi = new int[numColumns];
    yPosiOffset = new int[numColumns];
    for (int i=0; i<numColumns; i++) {
      xPosi[i]   = floor(random(0, 800));
      yPosiOffset[i] = floor(random(-500, 500));
    }
  }
}





////// MAIN //////
void setup() {
  size(800, 800);
  noStroke();

  cx = width/2.0;
  cy = height/2.0;
  ellipseMode(CENTER);
  colorMode(HSB, 360, 0, 1);
  f = createFont("Arial Black", 50);
  textFont(f);

  //creating and assigning arrays
  xPosi   = new int[numColumns];
  yPosiOffset = new int[numColumns]; 
  for (int i=0; i<numColumns; i++) {
    xPosi[i]   = floor(random(0, 800)); //fill xPosi with random values and convert to int
    yPosiOffset[i] = floor(random(-500, 500)); // fill array with position offset
  }
}


void draw() { 

  background(0);


  textSize(15);
  ellipse(cx, cy, radius*2, radius*2);
  time += 1;
  tt = time / 60;
  if (mouseX > cx-radius && mouseX < cx+radius && mouseY > cy-radius && mouseY < cy+radius) {
    cursor(HAND);
  } else { 
    cursor(ARROW);
  }

  ballFall();
  ballBreath();
  matrixRain();
}
