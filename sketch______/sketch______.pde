int squareSize = 5; // 正方形のサイズ
int speed = 5; // 移動速度
int numSquares = 50; // 黒い正方形の数
int[] x = new int[numSquares]; // 黒い正方形のx座標を保持する配列
int[] y = new int[numSquares]; // 黒い正方形のy座標を保持する配列
int[] directionX = new int[numSquares]; // x方向の移動方向を保持する配列（1: 右、-1: 左）
int[] directionY = new int[numSquares]; // y方向の移動方向を保持する配列（1: 下、-1: 上）
float changeDirectionProbability = 0.1; // 移動方向を変更する確率

void setup() {
  size(500, 500); // ウィンドウのサイズ
  
  // 各正方形の初期位置と移動方向のランダム設定
  for (int i = 0; i < numSquares; i++) {
    x[i] = int(random(width/squareSize))*squareSize; // ウィンドウ内のランダムなx座標
    y[i] = int(random(height/squareSize))*squareSize; // ウィンドウ内のランダムなy座標
    directionX[i] = int(random(3)) - 1; // -1, 0, 1のいずれかのランダムな値を設定
    directionY[i] = int(random(3)) - 1; // -1, 0, 1のいずれかのランダムな値を設定
  }
  
  // 正方形の描画
  for (int i = 0; i < width; i += squareSize) {
    for (int j = 0; j < height; j += squareSize) {
      fill(255); // 白色で塗りつぶし
      rect(i, j, squareSize, squareSize); // 正方形を描画
    }
  }
  
  frameRate(10);
}

void draw() {
   // 背景を白色にリセット
  
  // 各正方形の描画
  fill(0); 
  stroke(255);
  for (int i = 0; i < numSquares; i++) {
    rect(x[i], y[i], squareSize, squareSize); // 正方形を描画
  }
  
  // 各正方形の移動
  for (int i = 0; i < numSquares; i++) {
    // 確率的な移動方向の変更
    if (random(1) < changeDirectionProbability) {
      directionX[i] = int(random(3)) - 1; // -1, 0, 1のいずれかのランダムな値を設定
      directionY[i] = int(random(3)) - 1; // -1, 0, 1のいずれかのランダムな値を設定
    }
    
    // 移動
    x[i] += speed * directionX[i]; // x方向の移動
    y[i] += speed * directionY[i]; // y方向の移動
    
    // ウィンドウ端での反転
    if (x[i] <= 0 || x[i] >= width - squareSize) {
      directionX[i] *= -1; // 移動方向を反転
    }
    if (y[i] <= 0 || y[i] >= height - squareSize) {
      directionY[i] *= -1; // 移動方向を反転
    }
  }
}
