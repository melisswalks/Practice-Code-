float x, y, VelX, VelY, gravity;
int sz=50;
void setup(){
  size(800,600);
  x+=width/2;
  y+=height*.25;
  VelX=0;
  VelY=1;
  gravity=2;
}
void draw(){
  background (0);
  ellipse(x,y,sz,sz);
  x+=VelX;
  y+=VelY;
  VelY+=gravity;
  if(y+sz/2>height){
    VelY= -abs(VelY);
  }
}
