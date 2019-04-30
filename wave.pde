class wave {
  water water;
  int x;
  int z;
  PVector push;
  int speed;
  int speedCount;
  float radius;
  int totalPushed;
  int currentPushed;
  boolean collided;
  voxel v;
  float vspeed;

  wave(int x, int z, int speed, water water) {
    this.water = water;
    this.x = x;
    this.z = z;
    push = new PVector(0, 5, 0);
    this.speed = speed;
    speedCount = 0;
    radius = 0;
    totalPushed = water.voxels.length * water.voxels[0].length;
    currentPushed = 0;
    collided = true;
    v = new voxel((int)(x * water.res), -200, (int)(z * water.res), 10); 
    vspeed = 2;
  }

  void update() {
    if (!collided) {
      v.pos.add(new PVector(0, vspeed *= 1.1, 0));
      v.display();
      if (v.pos.y > -10) {
        collided = true; 
      }
    } else { 
      if (currentPushed >= totalPushed) {
        delete();
      } else { 
        if (speedCount == speed) {
          for (int i = 0; i < water.voxels.length; ++i) {
            for (int j = 0; j < water.voxels[0].length; ++j) {
              float dist = sqrt(sq(x - i) + sq(z - j));
              if (dist >= radius - 0.5 && dist <= radius + 0.5) {
                ++currentPushed;
                PVector p = push.copy();
                water.push(i, j, p);
              }
            }
          }
          radius += 1;
          speedCount = 0;
          push.mult(0.98);
        } else {
          ++speedCount;
        }
      }
    }
  }

  void delete() {
    water.wavesToRem.add(this);
  }
}
