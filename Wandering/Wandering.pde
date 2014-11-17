float locax, locay; //declare location
float velx, vely; //declare velocity
float accx, accy; //declare accleration

int sz=50;
void setup(){
  size(800,600);
  velx=constrain(velx,-5,5);
  vely=constrain(vely,-5,5);
  //initialize location variables
   //initialize velocity
  velx = 0;
  vely = 0;

  //initialize acceleration
  accx = random(-.1, .1);
  accy = random(-.1, .1);
}

void draw() {
  accx = random(-.1, .1);
  accy = random(-.1, .1);

  fill(frameCount%random(255),random(255),random(255));
  stroke(frameCount%random(255),random(255),random(255));
  //add acceleration to velocity
  velx += accx;
  vely += accy;

  //limit velocity to avoid going uncontrollably fast
  velx = constrain(velx, -5, 5);
  vely = constrain(vely, -5, 5);

  //add velocity to location
  locax += velx;
  locay += vely;

  //draw a circle
  ellipse(locax, locay, sz, sz);

  //all of these are written so the ball goes completely off the screen
  if (locax - sz/2 > width) {      //if circle goes off of right edge...
    locax = -sz/2;                 //...wrap around to left edge
  }

  if (locax + sz/2 < 0) {          //if circle goes off of left edge....
    locax = width + sz/2;          //...wrap around to right edge
  }

  if (locay - sz/2 > height) {     //if circle goes beyond bottom...
    locay = -sz/2;                 //...wrap around to top
  }

  if (locay + sz/2 < 0) {          //if circle goes beyond top...
    locay = height + sz/2;         //...wrap around to bottom
  }
}

