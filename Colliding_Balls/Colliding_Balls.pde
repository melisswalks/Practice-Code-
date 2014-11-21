//declare loc, vel, and acc
PVector loc, vel, acc;
PVector mouse;
int sz = 70;

void setup() {
  size(800, 600);
  //initialize loc, vel, and acc
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();    //random unit vector
  acc = new PVector(0, 0);
  noCursor();
  mouse = new PVector();
}

void draw() {
  mouse.set(mouseX, mouseY);
  background(0);
  //move the ball
  vel.add(acc);
  loc.add(vel);

  //check to see if the mouse is inside the circle
  if (loc.dist(mouse) < sz/2) { //...if it is...
    fill(0, 200, 255);            //...fill with red
    if (loc.x < mouse.x) {      //if ball is on the left...
      vel.x = -abs(vel.x);      //...move it further left
    } else {                    //otherwise...  
      vel.x = abs(vel.x);       //...move it further right
    }
    if (loc.y < mouse.y) {      //And do the same for y
      vel.y = -abs(vel.y);
    } else {
      vel.y = abs(vel.y);
    }
  } else {                                          //...otherwise...
    fill(255, 0, 255);                               //...fill with green
  }
  //draw a small circle to indicate mouse location
  ellipse(loc.x, loc.y, sz, sz);

  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }
  ellipse(mouse.x, mouse.y, 5, 5);
}

