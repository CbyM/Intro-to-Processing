float r = random(0, 255); float g=random(0, 255); float b= random(0,255); 
float x= random(600); float y= random(600); float z= random(600); float v= random(600); float w= random(600);
float xx= random(600); float yy= random(600); float zz= random(600); float vv= random(600); float ww= random(600);
int rad = 5;

//// MAIN ////
void setup(){
  size(600,600);
  ellipse(width/2, height/2, width*0.5, height*0.5);
  strokeWeight(4);
  fill(255,0,0);
//smile
  arc(300,350,180,180,0, 3.14);
  line(210,350, 390, 350);
//left eye
  line(210, 290, 240, 220);
  line(240,220,270,290);
//right eye
  line(360,220,390,290);
  line(360,220, 330,290 );
// bals
  ellipse(x,xx,rad*2,rad*2);
  ellipse(y,yy,rad*2,rad*2);
  ellipse(z,zz,rad*2,rad*2);
  ellipse(v,vv,rad*2,rad*2);
  ellipse(w,ww,rad*2,rad*2);
  ellipse(x/2,xx/2,rad*2,rad*2);
  ellipse(y/2,yy/2,rad*2,rad*2);
  ellipse(z/2,zz/2,rad*2,rad*2);
  ellipse(v/2,vv/2,rad*2,rad*2);
  ellipse(w/2*3,ww/2*3,rad*2,rad*2);
  ellipse(x/2*3,xx/2*3,rad*2,rad*2);
  ellipse(y/2*3,yy/2*3,rad*2,rad*2);
  ellipse(z/2*3,zz/2*3,rad*2,rad*2);
  ellipse(v/2*3,vv/2*3,rad*2,rad*2);
  ellipse(w/2*3,ww/2*3,rad*2,rad*2);
}

void draw(){
  background(r/2*4, g/2*1, b/2*3);
  setup();
  fill(r,g,b);

}
