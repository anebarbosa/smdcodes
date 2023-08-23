void setup() {
  size(300,300);
  
  
}

void draw () {
  
  if(mouseX> 100){
    fill(250,0,0);
    ellipse(30,30,50,50);
  }
  else {
    fill(0,0,255);
    ellipse(30,30,50,50);
  }
  
}
