import 'dart:async';
import 'package:flutter/material.dart';

// Modelo para o Tijolo - Evita erros de tipagem no Web
class Brick {
  double x;
  double y;
  bool isVisible;
  Brick({required this.x, required this.y, this.isVisible = true});
}

class BrickBreakerGame extends StatefulWidget {
  const BrickBreakerGame({super.key});

  @override
  State<BrickBreakerGame> createState() => _BrickBreakerGameState();
}

class _BrickBreakerGameState extends State<BrickBreakerGame> {
  // Parâmetros da Bola
  double ballX = 0;
  double ballY = 0;
  double ballXStep = 0.015;
  double ballYStep = 0.01;

  // Parâmetros da Raquete
  double paddleX = 0;
  double paddleWidth = 0.4;

  // Estados do Jogo
  bool gameStarted = false;
  bool gameOver = false;
  bool gameWon = false;
  int score = 0;

  late List<Brick> bricks;

  @override
  void initState() {
    super.initState();
    _initBricks();
  }

  void _initBricks() {
    bricks = [
      // Linha 1
      Brick(x: -0.8, y: -0.8),
      Brick(x: -0.4, y: -0.8),
      Brick(x: 0.0, y: -0.8),
      Brick(x: 0.4, y: -0.8),
      Brick(x: 0.8, y: -0.8),
      // Linha 2
      Brick(x: -0.6, y: -0.7),
      Brick(x: -0.2, y: -0.7),
      Brick(x: 0.2, y: -0.7),
      Brick(x: 0.6, y: -0.7),
    ];
  }

  void startGame() {
    setState(() {
      gameStarted = true;
      gameOver = false;
      gameWon = false;
      score = 0;
      _initBricks();
    });

    Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      _update();

      if (gameOver || gameWon) {
        timer.cancel();
      }
    });
  }

  void _update() {
    setState(() {
      ballX += ballXStep;
      ballY += ballYStep;

      // Colisão Paredes
      if (ballX >= 1.0 || ballX <= -1.0) ballXStep *= -1;
      if (ballY <= -1.0) ballYStep *= -1;

      // Colisão Raquete
      if (ballY >= 0.9 &&
          ballX >= paddleX - (paddleWidth / 2) &&
          ballX <= paddleX + (paddleWidth / 2)) {
        ballYStep *= -1;
      }

      // Colisão Tijolos
      for (var brick in bricks) {
        if (brick.isVisible) {
          if (ballY <= brick.y + 0.05 &&
              ballY >= brick.y - 0.05 &&
              ballX <= brick.x + 0.15 &&
              ballX >= brick.x - 0.15) {
            brick.isVisible = false;
            ballYStep *= -1;
            score += 10;
          }
        }
      }

      if (bricks.every((b) => !b.isVisible)) gameWon = true;
      if (ballY >= 1.0) gameOver = true;
    });
  }

  void resetGame() {
    setState(() {
      ballX = 0;
      ballY = 0;
      paddleX = 0;
      gameStarted = false;
      gameOver = false;
      gameWon = false;
      _initBricks();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pegamos a largura para os tijolos serem proporcionais
    final gameWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min, // Importante para não expandir infinito
      children: [
        Text(
          "PONTOS: $score",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),

        // CONTAINER COM ALTURA FIXA - Isso resolve o erro de RenderFlex
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.blueAccent, width: 3),
          ),
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                paddleX += details.delta.dx / (gameWidth / 2);
                paddleX = paddleX.clamp(-1.0, 1.0);
              });
            },
            child: Stack(
              children: [
                // Renderizar Tijolos
                ...bricks
                    .where((b) => b.isVisible)
                    .map(
                      (b) => Align(
                        alignment: Alignment(b.x, b.y),
                        child: Container(
                          width: gameWidth * 0.1,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),

                // Bola
                Align(
                  alignment: Alignment(ballX, ballY),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      color: Colors.yellowAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // Raquete
                Align(
                  alignment: Alignment(paddleX, 0.95),
                  child: Container(
                    width: gameWidth * (paddleWidth / 2),
                    height: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Overlay de Mensagens
                if (!gameStarted || gameOver || gameWon)
                  Container(
                    color: Colors.black87,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            gameOver
                                ? "GAME OVER"
                                : (gameWon ? "VITÓRIA!" : "BRICK BREAKER"),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: gameOver || gameWon
                                ? resetGame
                                : startGame,
                            child: Text(
                              gameOver || gameWon ? "TENTAR DENOVO" : "COMEÇAR",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
