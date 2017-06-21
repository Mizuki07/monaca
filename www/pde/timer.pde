//タイマー Mode 2
class Timer{
  int min, min_;
  int sandAmount;
  int remMin=3;//残り分
  int remSec=59;//残り秒

  Sand[] sands = new Sand[100];
  int count;
  int SerNum;
  color bgColors[] = {color(200,100), color(180,100),  color(160,100) , color(120,100)};
  color bgColor = color(120,100);
  int colorNum = 3;
  
  Timer(){  
  mil_ = millis();
  textAlign(CENTER, TOP);
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
  if(count%60 ==0 && SerNum<180){
    SandNum sand = new SandNum(SerNum,bgColor,colorNum);
    sands[SerNum] = sand;
    SerNum++;
    colorNum=int(random(bgColors.length));
    bgColor = bgColors[colorNum];
  }
 
  for(int i=0; i<sands.length; i++){
    if(i < (count) && sands[i] != null){
      sands[i].draw();
    }
  }
  fill(160); 
  
  }else{
  fill(#ff9096); 
  sandAmount = h/2;
  remMin = 0;
  remSec = 0;
  remMin_ = remMin;
  remSec_ = remSec;
  }
    
  //砂
  noStroke();
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

class SandNum{
  float x;
  float y;
  int y_ini_;
  int count;
  int SerNum_;
  float rot;
  color bgColor_;
  int colorNum_;
  
  SandNum(int SerNum ,color bgColor , int colorNum){
  x = width/2;
  rot = random(-1,1);
  y_ini_ = h/2;
  y = y_ini_;
  SerNum_ = SerNum;
  bgColor_=bgColor;
  colorNum_ = colorNum;
  }

  void draw(){
    if( y <=h){
    count++;
    fill(bgColor_);
    pushMatrix();
    translate(x,y);
    pushMatrix();
    rotate(rot); 
    text(180-SerNum_, 0, 0);
    popMatrix();
    popMatrix();
    y = y_ini_ + count*9.8*(colorNum_+1)*0.1;
    }
    }
}