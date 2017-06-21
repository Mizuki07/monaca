//日めくり Mode 0
class Today{
  float now; //今日何分経過したか
  int sandAmount;
  color[] sndClor ={#232a3a , #f19072, #a0d8ef, #2ca9e1, #007bbb, #8491c3, #b7282e, #192f60};//瞑色→東雲→空色→天色→紺碧→紅掛空色→茜色→紺青色
  int hour;
  float colorLerp;
  float test;
  int count;
  Sand[] sands = new Sand[100]; 
  
  Today(){
  for(int i=0; i<sands.length; i++){
  Sand sand = new Sand();
  sands[i] = sand;
  } 
  }
  
  void draw(){
  count ++;
  now= myHour*60 + myMinutes;
  sandAmount = int(now/1440*(h/2));

  hour = int(myHour/3); //どの色番号か
  colorLerp = ((myHour%3)*60 + myMinutes)/180; //3時間の中でどのくらい経過したか
  background(240);

  stroke(lerpColor(color(sndClor[hour%8]),color(sndClor[(hour+1)%8]),colorLerp));   
  for(int i=0; i<sands.length; i++){
    if(i < (count)){
      sands[i].draw();
    }
  }
  noStroke();
  fill(lerpColor(color(sndClor[hour%8]),color(sndClor[(hour+1)%8]),colorLerp));  
  //砂  
  pushMatrix();
  translate(0,h/2);
  scale(1,-1);
  rect(0,0,w,h/2-sandAmount);//上
  popMatrix();
  pushMatrix();
  translate(0,h);
  scale(1,-1);
  rect(0,0,w,sandAmount);//下
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