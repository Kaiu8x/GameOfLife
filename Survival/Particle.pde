//Kai Kawasaki Ueda A01336424
//#IBCS3 "Chapter2 E_10"
//Profesor: José Manuel Vega Cebrián
class Particle {
  PVector loca,velo,acce;
  float lifespan,r=6;

  Particle(float x, float y) {
    acce = new PVector();
    velo = PVector.random2D();
    loca = new PVector(x, y);
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void intersects(ArrayList<Particle> particles) {
    for (Particle other : particles) {
      if (other != this) {
        PVector dir = PVector.sub(loca, other.loca);
        if (dir.mag() < r*2) {
          dir.setMag(0.5); 
          applyForce(dir);
        }
      }
    }
  }

  void applyForce(PVector f) {
    acce.add(f);
  }

  // Method to update location
  void update() {
    velo.add(acce);
    loca.add(velo);
    acce.mult(0);
    lifespan -= 2.0;
    checkEdges();
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(loca.x, loca.y, r*2, r*2);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
  
  void checkEdges() {

    if (loca.x > width) {
      loca.x = width;
      velo.x *= -1;
    } 
    else if (loca.x < 0) {
      loca.x = 0;
      velo.x *= -1;
    }

    if (loca.y > height) {
      loca.y = height;
      velo.y *= -1;
    } 
    else if (loca.y < 0) {
      loca.y = 0;
      velo.y *= -1;
    }

  }
}