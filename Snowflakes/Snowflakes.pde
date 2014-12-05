
int count = 1000;
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];
int minDiam =1;
int maxDiam = 6;
void setup() {
  size(800, 600);
  for (int i = 0; i < count; i++) {
    sz[i] = random(minDiam,maxDiam);
    loc[i] = new PVector(random(width), random(-height*3,-sz[i]/2),map(sz[i],minDiam,maxDiam,10,255));
    vel[i] = new PVector(0, 1);
    acc [i]= new PVector(0, .1);
    
  }
  noStroke();
  
}

void draw() {
  background(0, 20, 70);
  for (int i = 0; i < count; i++) {
    acc[i].x = random(-.05, .05);
    vel[i].add(acc[i]);
    vel[i].limit(2);
    loc[i].add(vel[i]);
    fill(255,loc[i].z);
    ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);
    if (loc[i].y -sz[i]/2 > height) {
      loc[i].set(random(width),random(-height,-sz[i]/2));
      vel[i].set(0, 1);
    }
  }
}

