//タイマー Mode 2
class Timer{
  int min, min_;
  int sandAmount;
  int remMin=3;//残り分
  int remSec=59;//残り秒

  Sand[] sands = new Sand[100];
  int count;
  
  Timer(){  
  for(int i=0; i<sands.length; i++){
  Sand sand = new Sand(i);
  sands[i] = sand;
  }
  mil_ = millis();
  
  }
  
  void draw(){
  pushMatrix();
  translate(w,h);
  rotate(PI);
  mil = millis();
  
  if(((mil - mil_)/180000)<1){
   
  remMin = int((181000-(mil - mil_))/1000/60);
  remSec = (180 - int((mil - mil_)/1000))%60;
  remMin_ = remMin;
  remSec_ = remSec;
  
  sandAmount = int(((mil - mil_)/180000)*(height/2));
  
  count ++;
  background(240);   
  stroke(50);
      for(int i=0; i<sands.length; i++){
        if(i < (count)){
          sands[i].draw();
        }
      }      

  }else{
  sandAmount = h/2;
  remMin = 0;
  remSec = 0;
  remMin_ = remMin;
  remSec_ = remSec;
  }
    
  //砂
  noStroke();
  fill(160);
  pushMatrix();
  translate(0,h/2);
  scale(1,-1);
  rect(0,0,w,h/2-sandAmount);
  popMatrix();
  pushMatrix();
  translate(0,h);
  scale(1,-1);
  rect(0,0,w,sandAmount);
  popMatrix();
  
  //砂時計
  beginShape(TRIANGLES);
  noStroke();
  fill(255);
  vertex(0, 0);
  vertex(w/2-12, h/2);
  vertex(0,h);  
  vertex(w, 0);
  vertex(w,h);
  vertex(w/2+12,h/2);  
  endShape();
  
  popMatrix();
}
}