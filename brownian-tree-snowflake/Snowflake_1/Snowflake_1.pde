 Particle current;
 ArrayList<Particle> snowflake;
 
 void setup() {
   size(600,600);
   current = new Particle(width/2,random(10));
   snowflake = new ArrayList<Particle>();  
 }
 
 
 void draw() {
  translate(width/2, height/2); // translate to the center of the screen
  rotate(PI/6);
  background(0);
  
  while (!current.finished() && !current.intersects(snowflake)) { 
  current.update();
 }
      
  for (int i = 0; i < 6; i++) {
    rotate(PI/3);
    current.show();
    
      
    if (current.finished() || current.intersects(snowflake)) {
     snowflake.add(current);
     current = new Particle(width/2,0);
      
    }
    
    for (Particle p: snowflake) {
     p.show(); 
    }
    
    
    // Create reflextion effect
    pushMatrix();
    scale(1,-1);
    for (Particle p: snowflake) {
     p.show(); 
    }
    popMatrix();
   }
 
 }
