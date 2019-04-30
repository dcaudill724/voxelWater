class voxel {
  PVector origin;
  PVector pos;
  PVector speed;
  float size;

  voxel (int x, int y, int z, float size) {
    origin = new PVector(x, y, z);
    pos = origin.copy();
    speed = new PVector(0, 0, 0);
    this.size = size;
  }

  void update() {
    float dist = pos.dist(origin);
    if (speed.mag() < 0.1 && dist < 0.1) {
      speed = new PVector(0, 0, 0);
      pos = origin.copy();
    } else {
      PVector dir = origin.copy().sub(pos).mult(0.01);
      speed.add(dir).mult(0.98);
      pos.add(speed);
    }
  }

  void display() {
    int c = (int)map((pos.y + 15) % 40, 0, 40, 0, 255);
    fill(c, 255, 255);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(size);
    popMatrix();
  }
} 
