
PShape burton;

void setup() {
  size(800, 800);
  background(0);
 
  burton = loadShape("burton1.svg");
} 

void draw() {
  background(255);
  // Center where we will draw all the vertices
  translate(width/2 - burton.width/2, height/2- burton.height/2);
  
  // Iterate over the children
  PVector previous = new PVector(0,0);
  int children = burton.getChildCount();
  for (int i = 0; i < children; i++) {
    PShape child = burton.getChild(i);
    int total = child.getVertexCount();
   
   if(total >0)
    previous = child.getVertex(0);
    // Now we can actually get the vertices from each child
    for (int j = 1; j < total; j++) {
      PVector v = child.getVertex(j);
      // Cycling brightness for each vertex
      stroke((frameCount + (i+1)*j) % 255);
      // Just a dot for each one
      //stroke(0);
      //point(v.x, v.y);
      line(previous.x,previous.y, v.x, v.y);
      previous = v;
  }
  }
}