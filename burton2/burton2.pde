float[] x,y,nx,ny;
int n = 500;
float d = 1;
float dx,dy,dist,diff,percent,err;

PShape burton;
PShape mountain;
void setup() {
  size(1000,1000);
  reset();
  background(0);
  burton = loadShape("burton1.svg");
  mountain = burton.getChild(3);
}

void mousePressed() {
  reset();
}

void reset() {
  x = new float[n];
  y = new float[n];
  nx = new float[n];
  ny = new float[n];
  for(int i=0;i<n;i++) {
    x[i] = random(-width*4,width*5);
    y[i] = random(-height*4,height*5);
    nx[i] = 0;
    ny[i] = 0;
  }
}

void draw() {
  err = 0;
  //
  for(int i=0;i<n;i++) {
    dx = x[(i+1)%n]-x[i];
    dy = y[(i+1)%n]-y[i];
    dist = sqrt(dx*dx+dy*dy);
    diff = d - dist;
    err += abs(diff);
    percent = (diff/dist)*0.5;
    dx = dx*percent;
    dy = dy*percent;
    nx[i] -= dx;
    ny[i] -= dy;
    nx[(i+1)%n] += dx;
    ny[(i+1)%n] += dy;
  }
  //
  for(int i=0;i<n;i++) {
    x[i] += nx[i];
    y[i] += ny[i];
    nx[i] = 0;
    ny[i] = 0;
  }
  //
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  //
  stroke(255);
  strokeWeight(0.2);
  noFill();
  beginShape();
  for(int i=0;i<n;i++) {
    vertex(x[i],y[i]);
  }
  endShape(CLOSE);
  //
  if(err<1000) reset();
}