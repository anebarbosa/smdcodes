int[][] matriz;
float cartaTamanho;
int matrizTamanho;
int pacmanI, pacmanJ;
int direcao;

void setup() {
  size(400, 400);
  matrizTamanho = 20;
  criar(matrizTamanho);
  cartaTamanho = width / matriz.length;
  pacmanI = 0; // Linha inicial do Pacman
  pacmanJ = 0; // Coluna inicial do Pacman
  direcao = 0;
  noStroke();
}

void draw() {
  desenhar();
  desenharPacman();
  if (matriz[pacmanI][pacmanJ] == 2) {
    fimDeJogo();
  }
}

void criar(int n) {
  // Inicializa o tabuleiro com valores representando as paredes (2), os pontos (1) e a posição inicial do Pacman (3)
  matriz = new int[n][n];
  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {
      // Adicionei a condição para definir as paredes
      if (i == 0 || i == matriz.length - 1 || j == 0 || j == matriz[0].length - 1) {
        matriz[i][j] = 0; // Preto
      } else if (i == 1 || i == matriz.length - 2 || j == 1 || j == matriz[0].length - 2) {
        matriz[i][j] = 1; // Branco
        if (i == 1 && (j == (matriz[0].length - 1)/2 || j == (matriz[0].length - 1)/2 + 1)) {
          matriz[i][j] = 0;
        }
      } else if (i == 2 || i == matriz.length - 3 || j == 2 || j == matriz[0].length - 3) {
        matriz[i][j] = 0;
      } else if (i == 3 || i == matriz.length - 4 || j == 3 || j == matriz[0].length - 4) {
        matriz[i][j] = 1;
        if (i == matriz.length - 4 && (j == (matriz[0].length - 1)/2 || j == (matriz[0].length - 1)/2 + 1)) {
          matriz[i][j] = 0;
        }
      } else if (i == 4 || i == matriz.length - 5 || j == 4 || j == matriz[0].length - 5) {
        matriz[i][j] = 0;
      } else if (i == 5 || i == matriz.length - 6 || j == 5 || j == matriz[0].length - 6) {
        matriz[i][j] = 1;
        if (i == 5 && (j == (matriz[0].length - 1)/2 || j == (matriz[0].length - 1)/2 + 1)) {
          matriz[i][j] = 0;
        }
      } else if (i == 6 || i == matriz.length - 7 || j == 6 || j == matriz[0].length - 7) {
        matriz[i][j] = 0;
      } else if (i == 7 || i == matriz.length - 8 || j == 7 || j == matriz[0].length - 8) {
        matriz[i][j] = 1;
        if (i == matriz.length - 8 && (j == (matriz[0].length - 1)/2 || j == (matriz[0].length - 1)/2 + 1)) {
          matriz[i][j] = 0;
        }
      } else if (i == 8 || i == matriz.length - 9 || j == 8 || j == matriz[0].length - 9) {
        matriz[i][j] = 0;
      } else {
        matriz[i][j] = 2;
      }
      print(matriz[i][j] + "   ");
    }
    println();
  }
  println();
}

void desenhar() {
  for (int i = 0; i < matriz.length; i++) {
    for (int j = 0; j < matriz[0].length; j++) {
      float x = j * cartaTamanho;
      float y = i * cartaTamanho;
      if (matriz[i][j] == 0) {
        fill(0); // Preto
        rect(x, y, cartaTamanho, cartaTamanho);
      } else if (matriz[i][j] == 1) {
        fill(255); // Branco
        rect(x, y, cartaTamanho, cartaTamanho);
      }
      else {
        fill(200); // Cinza
        rect(x, y, cartaTamanho, cartaTamanho);
      }
    }
  }
}

void desenharPacman() {
  float x = pacmanJ * cartaTamanho + cartaTamanho / 2;
  float y = pacmanI * cartaTamanho + cartaTamanho / 2;
  fill(255, 255, 0); // Amarelo para o Pacman
  float diametro = cartaTamanho;
  float anguloInicial = radians(45); // Default values
  float anguloFinal = radians(-45);

  // Define os ângulos da boca de acordo com a direção
  if (direcao == 0) {
    anguloInicial = radians(45);
    anguloFinal = radians(315);
  } else if (direcao == 1) {
    anguloInicial = radians(315);
    anguloFinal = radians(585);
  } else if (direcao == 2) {
    anguloInicial = radians(225);
    anguloFinal = radians(495);
  } else if (direcao == 3) {
    anguloInicial = radians(135);
    anguloFinal = radians(405);
  }

  // Desenha o Pacman com a boca
  arc(x, y, diametro, diametro, anguloInicial, anguloFinal, PIE);
}

void fimDeJogo() {
  fill(0); // Branco
  rect(0, 0, width, height);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(width/10);
  text("Fim de Jogo!", width / 2, height / 2);
  noLoop();
}

void keyPressed() {
  if (keyCode == UP && pacmanI - 1 >= 0 && (matriz[pacmanI - 1][pacmanJ] == 0 || matriz[pacmanI - 1][pacmanJ] == 2)) {
    direcao = 1; // Cima
    pacmanI--;
  } else if (keyCode == DOWN && pacmanI + 1 < matriz.length && (matriz[pacmanI + 1][pacmanJ] == 0 || matriz[pacmanI - 1][pacmanJ] == 2)) {
    direcao = 3; // Baixo
    pacmanI++;
  } else if (keyCode == LEFT && pacmanJ - 1 >= 0 && (matriz[pacmanI][pacmanJ - 1] == 0 || matriz[pacmanI - 1][pacmanJ] == 2)) {
    direcao = 2; // Esquerda
    pacmanJ--;
  } else if (keyCode == RIGHT && pacmanJ + 1 < matriz[0].length && (matriz[pacmanI][pacmanJ + 1] == 0 || matriz[pacmanI - 1][pacmanJ] == 2)) {
    direcao = 0; // Direita
    pacmanJ++;
  }
}
