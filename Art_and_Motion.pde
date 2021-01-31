float xL, yL; //mapped lines changing values
float z; // rotation variable


// orbit effect
void orbit() {
  fill(0);
  translate(width/2, height/2); //object displacement
  rotate(z);  
  ellipse(80, 80, 30, 30);
}

// changing ranges and line coordinates
void chords() {
  float mx = mouseX;
  float my = mouseY;
  for (float i = 0.0; i < width; i+=50.0) {
    xL = map(mx, i, 0, i, height);
    line(xL, 0, i, height);
    yL = map(my, i, 0, i, height);
    line(yL, 0, i, height);
  }
}


//// MAIN ////
void setup() {
  size(800, 800);
  strokeWeight(2);
}

void draw() {
  background(mouseX/2, mouseX, mouseY/2);
  text("Follow the moon around with your mouse for a pleasant effect!", width/2-200, 90);
  ellipse(width/2, height/2, 140, 140);
  chords();
  orbit();
  z +=0.02;
}
