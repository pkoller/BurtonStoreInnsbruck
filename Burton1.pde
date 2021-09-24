
PShape burton;

void setup() {
  size(800, 800);
  background(0);

  burton = loadShape("burton1.svg");
  PShape mountain = burton.getChild(3);
  vertexCount = mountain.getVertexCount();
  float x =0;
  float y = 0;
  for (int j = 0; j < vertexCount; j++) 
  {
    x += mountain.getVertex(j).x;
    y += mountain.getVertex(j).y;
  }

  centerOfMountain = new PVector(x/vertexCount, y/vertexCount);
} 

int vertexCount = 0;
PVector centerOfMountain;
void draw() {
  background(255);
  // Center where we will draw all the vertices
  translate(width/2 - burton.width/2, height/2- burton.height/2);
  ellipse(centerOfMountain.x, centerOfMountain.y, 10, 10);

  PVector previous = new PVector(0, 0);
  PShape child = burton.getChild(3);
  int total = child.getVertexCount();

  if (total > 0)
  {
    for (int i=0; i<3; i++)
    {
      
      previous = child.getVertex(0);
      for (int j = 0; j < total; j++) 
      {
        PVector v = child.getVertex(j);
        // Cycling brightness for each vertex
        stroke((frameCount + j) % 255);
        // Just a dot for each one
        //stroke(0);
        //point(v.x, v.y);
        
        PVector direction = PVector.sub(v,centerOfMountain);
        direction.normalize();
        direction.mult(j);
        line(previous.x + direction.x, previous.y + direction.y, v.x + direction.x , v.y + direction.y);
        previous = v;
      }
    }
  }
}