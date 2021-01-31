PFont font;
int scene;
//constant for G
float gravity=9.8;
//Constant for the floor line.
int ground=400;
// Constant X for the character(), move it a bit further from X=0 axis. Y axis so it doesnt merge with the ground.
int x=20, y=380;
float radius = 20;
//Enemy variables. X for enemy_down and Xx for enemy_up. The goal is to compute different X values so they dont spawn at the same time on the same X axis.
float enemyX = 500; 
float enemyXx= 800; 
float enemyY=random(260, 300);
//Crazy_Ball variables
float crazyBall_X = 150;
float crazyBall_Y = 100;
float crazyBall_speedX = 2;
float crazyBall_speedY = 3;
//TimeZone
float i = 0;
boolean flag = true;
//Time Count
float counter = 0;
boolean t= false;
//collision

///////////////////////////////////

//Functions:
void character() {
  fill(255, 255, 0);
  ellipse(x, y, radius*2, radius*2);
}

//box ground
void enemy_down() {
  fill(255, 0, 0);
  square(enemyX, 350, 50);
  enemyX -= 5;
  if (enemyX < -20) {  //If  enemyX is out of the screen, respawn it back.
    enemyX = random(550, 800);
  }
}

//box flying
void enemy_up() {
  fill(255, 1, 0);
  square(enemyXx, enemyY, 50); 
  enemyXx -= 5;
  if (enemyXx < -20) {
    enemyXx = random(800, 2100);
  }
}

//Random crazy ball
void Crazy_Ball() {
  float r=random(0, 255);
  float g=random(0, 255);
  float b=random(0, 255);
  fill(r, g, b);
  strokeWeight(2);
  ellipse(crazyBall_X, crazyBall_Y, 20, 20);

  crazyBall_X+= crazyBall_speedX;
  crazyBall_Y += crazyBall_speedY;

  if (crazyBall_X < 0 || crazyBall_X > width) {
    crazyBall_speedX *= -1;
  }
  if (crazyBall_Y < 0 || crazyBall_Y > height) {
    crazyBall_speedY *=-1;
  }
}


//Changing between day and night
void TimeZone() {
  if (flag == true) {
    i+=0.2;
    if (i == 254) {
      flag = false;
    }
  }
  if (flag == false) {
    i-=0.3;
    if (i == 0) {
      flag = true;
    }
  }
}


//Time Count
void Time() {
  if (t == true) {
    fill(1);
    counter+=1;
    float time = counter /60;  
    text(time, 100, 100);
  }
}



//HOME Screen
void HOME() {

  line(0, 400, 600, 400);
  fill(0);
  textFont(font, 50);
  textAlign(CENTER);
  text("Press any key to play", width/2, height/2);
  if (keyPressed == true) {
    scene = 1;
    t = true;
  }
}


//Game function
void GAME() {

  if (keyPressed == true) {
    y -=10;
    if (y <= 250 && keyPressed == true) {  
      y += 10;
    }
  }
  if (y < 380 && keyPressed == false) {
    y += gravity;
  }
  character();
  enemy_down();
  enemy_up();
}

///// MAIN /////

void setup() {
  size(600, 600);
  font = createFont("Arial", 16, true);
  scene = 0;
}

void draw() {

  background(i, i, i);
  TimeZone();
  line(0, 400, 600, 400);
  Time();
  switch(scene) {

  case 0:
    HOME();
    break;
  case 1:
    GAME();
    Crazy_Ball();
    break;
  }//end switch
}//end draw
