
PShape burton;

void setup() {
  size(1000, 1000);
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
  //translate(width/2 - burton.width/2, height/2- burton.height/2);
  //ellipse(centerOfMountain.x, centerOfMountain.y, 10, 10);

  PVector previous = new PVector(0, 0);
  PVector originalPrevious = new PVector(0, 0);
  PVector originalNext = new PVector(0, 0);
  
  PVector act = new PVector(0, 0);

  PShape child = burton.getChild(3);
  int total = child.getVertexCount();

  if (total > 0)
  {
    for (int i=0; i<50; i++)
    {
      previous = child.getVertex(0);
      for (int j = 1; j < total; j++) 
      {
        originalPrevious = child.getVertex(j-1);
        originalNext = child.getVertex((j+1)%total);
        act = child.getVertex(j);
        
        stroke(0);//(frameCount*10 + j) % 255*(i+1));
        // Just a dot for each one  
        //stroke(0);
       
        PVector oldLine = PVector.sub(act,originalPrevious);
        PVector nextLine = PVector.sub(originalNext, act);
        
        float angle = PVector.dot(oldLine, nextLine);
          
        PVector mouse = new PVector(mouseX, mouseY);
        PVector direction = PVector.sub(act, mouse);
        direction.normalize();
        direction.mult(i*10);
        act.add(direction);  // offset the act vertex

        line(previous.x, previous.y, act.x, act.y);
        //line(previous.x + direction.x, previous.y + direction.y, prepre.x, prepre.y);
        //prepre = previous;
        previous = act;
      }
    }
  }
}