// Necessário para console e visual interativo.
int[][] tabuleiro;
// Necessário para draw
int tamanhoCelula = 40;
int linhas = 6;
int colunas = 5;
int quantidadeZeros;
int quantidadeReveladas;
boolean[][] celulasReveladas;

// Necessário para console e visual interativo.
void settings() {
  size(tamanhoCelula * colunas, tamanhoCelula * linhas);
}


// Necessário para console e visual interativo.
void setup() {
  inicializarTabuleiro(linhas, colunas);
  teste(3,2);
}

// Necessário para visual interativo.
void draw() {
  desenharTabuleiro();
}

// Necessário para console e visual interativo.
void inicializarTabuleiro(int m, int n) {
  // Inicializa o tabuleiro com valores aleatórios (0 ou 1)
  tabuleiro = new int[m][n];
  celulasReveladas = new boolean[m][n];
  quantidadeZeros = 0;
  quantidadeReveladas = 0;
  for (int i = 0; i < tabuleiro.length; i++) {
    for (int j = 0; j < tabuleiro[0].length; j++) {
      tabuleiro[i][j] = int(random(2));
      print(tabuleiro[i][j] + "   ");
      if (tabuleiro[i][j] == 0){
        quantidadeZeros++;
      }
    }
    println();
  }
  println();
}

// Necessário somente para console.
boolean teste(int i, int j) {
  if (i >= 0 && i < tabuleiro.length && j >= 0 && j < tabuleiro[0].length) {
    if (tabuleiro[i][j] == 1) {
      println("Bomba encontrada na posição (" + i + ", " + j + ")!");
      println("Fim de jogo.");
      return true;
    } else {
      println("Nenhuma bomba na posição (" + i + ", " + j + ").");
      relatorioVizinhanca(i, j);
      return false;
    }
  } else {
    println("Posição inválida.");
    return false;
  }
}

// Necessário somente para console.
void relatorioVizinhanca(int i, int j) {
  // Verifica as posições livres de bombas na vizinhança-8
  println("Relatório da vizinhança-8:");
  for (int x = i - 1; x <= i + 1; x++) {
    for (int y = j - 1; y <= j + 1; y++) {
      if (x >= 0 && x < tabuleiro.length && y >= 0 && y < tabuleiro[0].length && (x != i || y != j)) {
        if (tabuleiro[x][y] == 0) {
          println("Posição livre em (" + x + ", " + y + ")");
        }
      }
    }
  }
}

// Necessário para visual interativo.
void desenharTabuleiro() {
  for (int i = 0; i < tabuleiro.length; i++) {
    for (int j = 0; j < tabuleiro[0].length; j++) {
      // Desenha as células
      fill(255);
      stroke(0);
      // (j, i) para que aumente x a cada iteração de j e y a cada iteração de i
      rect(j * tamanhoCelula, i * tamanhoCelula, tamanhoCelula, tamanhoCelula);
      
      // Mostra o valor da célula se ela foi revelada
      if (celulasReveladas[i][j] == true) {
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(16);
        text(str(tabuleiro[i][j]), j * tamanhoCelula + tamanhoCelula / 2, i * tamanhoCelula + tamanhoCelula / 2);
      }
      
      // Mostra todos os valores se perdeu ou venceu o jogo
      
    }
  }
}

// Necessário para visual interativo.
void mousePressed() {
  int colunaClicada = mouseX / tamanhoCelula;
  int linhaClicada = mouseY / tamanhoCelula;

  if (colunaClicada < tabuleiro[0].length && linhaClicada < tabuleiro.length) {
    if (tabuleiro[linhaClicada][colunaClicada] == 1) {
      // Se houver uma bomba na célula clicada, game over
      revelarTodasCelulas();
      gameOver();
    } else {
      // Se não houver bomba, mostra o valor da célula
      revelarCelula(linhaClicada, colunaClicada);
    }
    // Se achar todos os 0, o jogo é vencido
    if (quantidadeReveladas == quantidadeZeros){
      revelarTodasCelulas();
      youWin();
    }
  }
}

// Necessário para visual interativo.
void revelarCelula(int linha, int coluna) {
  // Simplesmente imprime o valor da célula na tela
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(str(tabuleiro[linha][coluna]), coluna * tamanhoCelula + tamanhoCelula / 2, linha * tamanhoCelula + tamanhoCelula / 2);
  
  // Marca a célula como revelada
  celulasReveladas[linha][coluna] = true;
  quantidadeReveladas++;
}

void revelarTodasCelulas() {
  for (int i = 0; i < tabuleiro.length; i++) {
    for (int j = 0; j < tabuleiro[0].length; j++) {
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(16);
      text(str(tabuleiro[i][j]), j * tamanhoCelula + tamanhoCelula / 2, i * tamanhoCelula + tamanhoCelula / 2);
    }
  }
}

// Necessário para visual interativo.
void gameOver() {
  // Exibe mensagem de fim de jogo
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Game Over!", width / 2, height / 2);
  noLoop();  // Para a animação
}

// Necessário para visual interativo.
void youWin() {
  // Exibe mensagem de fim de jogo
  fill(#16B441);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("You Win!", width / 2, height / 2);
  noLoop();  // Para a animação
}
