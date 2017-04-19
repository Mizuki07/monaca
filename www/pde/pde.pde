/* //@pjs pauseOnBlur="true"; */
/* //@pjs globalKeyEvents="true"; */

Sand[] sands = new Sand[100];
int w = $(window).innerWidth();
int h = $(window).innerHeight();
int t;

void setup(){
  size(w,h);
  smooth();
  noStroke();
  for(int i=0; i<sands.length; i++){
  Sand sand = new Sand();
  sand.x = random(width/2-8, width/2+8);
  sand.y = 0;
  sands[i] = sand;
  }
}

void draw(){
  t++;
  background(240);
  
  for(int i=0; i<sands.length; i++){
    if(i < (frameCount/0.6)){
      sands[i].draw();
    }
  }
  
  //砂
  noStroke();
  fill(160);
  pushMatrix();
  translate(0,h/2);
  scale(1,-1);
  rect(0,0,w,h/2-t/100);
  popMatrix();
  pushMatrix();
  translate(0,h);
  scale(1,-1);
  rect(0,0,w,t/100);
  popMatrix();
  
  //砂時計
  beginShape(TRIANGLES);
  noStroke();
  fill(255);
  vertex(0, 0);
  vertex(width/2-12, h/2);
  vertex(0,h);  
  vertex(w, 0);
  vertex(w,h);
  vertex(w/2+12,h/2);  
  endShape();
  
}

class Sand{
  float x;
  float y;
  int count= 0;
  void draw(){
    if(y<h){
    count++;
    fill(160);
    stroke(50);
    strokeWeight(1);
    point(x, y);
    y = h/2 + count + count*0.5*9.8;
    }else{
    y=h/2;
    count=0;
    }
    }
}