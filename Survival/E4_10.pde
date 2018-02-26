//Kai Kawasaki Ueda A01336424
//#IBCS3 "Chapter3 E_10"
//Profesor: José Manuel Vega Cebrián
ParticleSystem ps;

void setup() {
  size(700,700);
  ps = new ParticleSystem(new PVector(width/2,50));
}

void draw() {
  background(224);
  ps.addParticle(random(width),random(height));
  ps.update();
  ps.intersection();
  ps.display();
}