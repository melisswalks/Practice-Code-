//declare and initialize the GravityBall array
GravityBall[] g = new GravityBall[100];
//float[] numbers = new float[100];    //this is here for comparison

void setup() {
  size(800, 600);
 
  for (int i = 0; i < g.length; i++) {
    g[i] = new GravityBall();
    
  }
}

void draw() {
  background(0);

  for (int i = 0; i < g.length; i++) {
    g[i].display();
    g[i].move();
    g[i].bounce();
  }
}



class GravityBall {

  PVector loc, vel, acc;
  float sz;

  GravityBall() {

    sz = 100;
    loc = new PVector(random(sz, width-sz), random(height/2));
    vel = new PVector(0, 0);
    acc = new PVector(0, .1);
  }
  
  void display() {
    //display the ball
    ellipse(loc.x, loc.y, sz, sz);
    fill(100,50,200);
    fill(random(255),random(255),random(255));
  }

  void move() {
    //move the ball
    vel.add(acc);
    loc.add(vel);
  }

  void bounce() {
    //bounce ball off of floor
    if (loc.y > height + sz/2) {
      loc.y = height + sz/2;
      vel.y = -abs(vel.y);
    }
  }
}

