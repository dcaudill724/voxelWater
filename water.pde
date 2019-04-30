class water {
  float w;
  float d;
  float res;
  PVector size;
  voxel[][] voxels;
  ArrayList<wave> waves;
  ArrayList<wave> wavesToRem;

  water(float res, int x, int z) {
    w = x * res;
    d = z * res;
    this.res = res;
    size = new PVector(x, z);
    voxels = new voxel[x][z];
    for (int i = 0; i < size.x; ++i) {
      for (int j = 0; j < size.y; ++j) {
        voxels[i][j] = new voxel((int)(i * res), (int)res, (int)(j * res), res);
      }
    }
    waves = new ArrayList<wave>();
    wavesToRem = new ArrayList<wave>();
  }

  void push(int x, int z, PVector push) {
    voxels[x][z].speed.add(push);
  }
  
  void startWave(int x, int z) {
    waves.add(new wave(x, z, 1, this));
  }

  water update() {
    for (wave w : wavesToRem) {
      waves.remove(w); 
    }
    for (wave w : waves) {
      w.update(); 
    }
    for (int i = 0; i < voxels.length; ++i) {
      for (int j = 0; j < voxels[i].length; ++j) {
        voxels[i][j].update();
      }
    }
    return this;
  }

  void display() {
    for (int i = 0; i < voxels.length; ++i) {
      for (int j = 0; j < voxels[i].length; ++j) {
        voxels[i][j].display();
      }
    }
  }
}
