//月 Mode 1
class Month{
  int sandAmount;
  int pastDay;
  color[][] sndClor ={
  {#b9c3c9, #94abc1, #7ecef4, #88abda}, //冬 0
  {#fadbd9, #ef8a9c, #f8c5ac, #fff799},//春 1
  {#00a0e9, #9fd9f6, #d4ecea, #fff100},//夏 2
  {#e5a83f, #ceaf06, #9c580a, #db5425}//秋 3
  };
  int season;
  int colorNum=0;
  float colorLerp;
  Sand[] sands = new Sand[100]; 
  int count;
  
  Month(){
  for(int i=0; i<sands.length; i++){
  Sand sand = new Sand(i);
  sands[i] = sand;
  }
  }
  
  void draw(){
  colorLerp+=0.001;
  
  pastDay=0;
  
  if(myMonth > 1){
  for(int i; i< myMonth-1; i++){
  pastDay = pastDay + myMonthTbl[i];
  }
  }
  pastDay = pastDay + myToday;
  test = pastDay;
  
  sandAmount = int((pastDay/365)*(height/2));
  season = floor(myMonth/3)%4;
  count ++;
  background(240);
 
  stroke(lerpColor(color(sndClor[season][(colorNum)%4]),color(sndClor[season][(colorNum+1)%4]),colorLerp));
  for(int i=0; i<sands.length; i++){
   if(i < (count)){
  sands[i].draw();
   }
  }
  
    
  //砂
  noStroke();
  
  fill(lerpColor(color(sndClor[season][(colorNum)%4]),color(sndClor[season][(colorNum+1)%4]),colorLerp));
  if(colorLerp >=1){colorNum++; colorLerp=0;}
  
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
  vertex(width/2-12, h/2);
  vertex(0,h);  
  vertex(w, 0);
  vertex(w,h);
  vertex(w/2+12,h/2);  
  endShape();
  }
}