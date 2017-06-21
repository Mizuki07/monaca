/* //@pjs pauseOnBlur="true"; */
/* //@pjs globalKeyEvents="true"; */
/*@pjs font="./font/Gidole-Regular_min.ttf";*/

//int w = $(window).innerWidth();
//int h = $(window).innerHeight();

int w = w_;
int h = h_;

Timer timer;
Month month;
Today today;
int mode;

void setup(){
  size(w,h);
  smooth();
  frameRate(60);
  noStroke();
  textAlign(LEFT, CENTER);
  PFont myFont = loadFont("./font/Gidole-Regular_min.ttf");
  textFont(myFont,42); 
}

void draw(){
  if(mode_ == 0){
  if(today == null){
  today = new Today();
  month = null;
  timer = null;
  }
  today.draw();
  
  }else if(mode_ == 1){
  if(month == null){
  month = new Month();
  today = null;
  timer = null;
  }
  month.draw();
  
  }else{
  if(timer == null){
  timer = new Timer();
  today = null;
  month = null;
  }
  timer.draw();
  }
}

class Sand{
  float x;
  float y;
  int y_ini_;
  int count;
  
  Sand(){
  x = random(width/2-8, width/2+8);
  y_ini_ = h/2;
  y = y_ini_;
  }

  void draw(){
    if( y <=h ){
    count++;
    fill(160);
    strokeWeight(1.5);
    point(x, y);
    y = y_ini_ + count*0.5*9.8;
    }else{
    y=h/2;
    count=0;
    }
    }
}

void keyPressed() {
  if (key == 'p') {
    mode =0;
  }else if(key == 'q'){
    mode = 1;
  }
  else {
    mode = 2;
  }
}