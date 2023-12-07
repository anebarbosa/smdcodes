int n = 5;
// Declarar
int[][] matrizValor;
int[][] matrizEstado;
float cartaWidth;
float cartaHeight;
// Valor de dinheiro inicial
int cont=1000;

void setup() {
  size(400, 400);
  // Copiar matriz criada e inicializada por uma função para uma nova variável já declarada
  matrizValor = geraMatriz(n, -1000, 1000);
  matrizEstado = geraMatriz(n, 0, 0);
  
  cartaWidth = width / matrizValor.length;
  cartaHeight = height / matrizValor.length;
  
  println("Saldo inicial: " + cont);
}
void draw() {
  background(0);
  // Percorrer
  for(int i = 0; i < matrizValor.length; i++) {
    for(int j = 0; j < matrizValor[i].length; j++) {
      float x = j * cartaWidth;
      float y = i * cartaHeight;
      fill(255); // Cor de fundo da carta
      rect(x, y, cartaWidth, cartaHeight);
      if(matrizEstado[i][j] == 1) {
        fill(255, 3, 3); // Cor de fundo da carta
        rect(x, y, cartaWidth, cartaHeight);
        fill(0); // Cor do texto
        textSize(16);
        text(matrizValor[i][j], x + cartaWidth / 3, y + cartaHeight / 4);
      }
      if(matrizEstado[i][j] == 2) {
        fill(3, 255, 34); // Cor de fundo da carta
        rect(x, y, cartaWidth, cartaHeight);
        fill(0); // Cor do texto
        textSize(16);
        text(matrizValor[i][j], x + cartaWidth / 3, y + cartaHeight / 4);
      }
      if(cont <= 0) {
        noLoop();
      }
      //desenhaCarta(x, y, cartaWidth, cartaHeight, minhaMatriz[i][j]);
    }
  }
}

int[][] geraMatriz(int n, int vi, int vf) {
  // Declarar e criar
  int[][] matriz = new int[n][n];
  // Inicializar
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      matriz[i][j] = int(random(vi, vf + 1));
    }
  }
  return matriz;
}

void mousePressed() {
  //Modificar
  int i = int(mouseY/cartaHeight);
  int j = int(mouseX/cartaWidth);
  if(matrizValor[i][j] < 0) {
    matrizEstado[i][j] = 1; 
  }
  else {
    matrizEstado[i][j] = 2;
  }
  print("valor: " + matrizValor[i][j] + " ");
  print("estado: " + matrizEstado[i][j]);
  println();
  cont = cont + matrizValor[i][j];
  println("Novo saldo: " + cont);
  if(cont <= 0) {
    println("Perdeu");
  }
}

//void desenhaCarta(float x, float y, float largura, float altura, int valor) {
//  fill(255); // Cor de fundo da carta
//  rect(x, y, largura, altura); // Desenha o retângulo da carta
//  fill(0); // Cor do texto
//  textSize(16);
//  textAlign(CENTER, CENTER);
//  text("R$ " + valor, x + largura / 2, y + altura / 2); // Exibe o valor no centro da carta
//}
