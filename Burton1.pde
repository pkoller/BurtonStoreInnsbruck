
PShape burton;

void setup() {
  size(800, 800);
  background(0);
 
  burton = loadShape("burton1.svg");
  vertexCount = burton.getChild(3).getVertexCount();
  
} 

int vertexCount = 0;
void draw() {
  background(255);
  // Center where we will draw all the vertices
  translate(width/2 - burton.width/2, height/2- burton.height/2);
  
  // Iterate over the children
  PVector previous = new PVector(0,0);
  //int children = burton.getChildCount();
  //for (int i = 0; i < children; i++) {
    PShape child = burton.getChild(3);
    int total = child.getVertexCount();
   
   if(total > 0)
    {
      previous = child.getVertex(0);
      // Now we can actually get the vertices from each child
      for (int j = 0; j < total; j++) 
      {
          PVector v = child.getVertex(j);
        // Cycling brightness for each vertex
        stroke((frameCount + j) % 255);
        // Just a dot for each one
        //stroke(0);
        //point(v.x, v.y);
        line(previous.x,previous.y, v.x, v.y);
        previous = v;
      }
    }
  //}
}