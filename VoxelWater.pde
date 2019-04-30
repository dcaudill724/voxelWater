water w;
int waveCount;
int currentCount;

void setup() {
  size(600, 600, P3D); 
  w = new water(5, 100, 100);
  colorMode(HSB);
  currentCount = 0;
  waveCount = (int)random(100);
}

void draw() {
  background(0);
  lights();
  noStroke();
  translate(width / 2 - w.w / 2, height / 2 + 50, -70);
  w.update().display();
  if (currentCount == waveCount) {
    //w.startWave((int)random(100), (int)random(100));
    currentCount = 0;
    waveCount = (int)random(100);
  } else {
    currentCount++; 
  }
}

void mouseClicked() {
   w.startWave((int)random(100), (int)random(100));
   /*w.startWave(0, 0);
   w.startWave(0, 99);
   w.startWave(50,50);
   w.startWave(99, 0);
   w.startWave(99, 99);*/
}
