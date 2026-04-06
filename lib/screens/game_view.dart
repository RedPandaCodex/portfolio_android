import 'package:flutter/material.dart';
import '../widgets/brick_breaker_game.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Brick Breaker Minigame"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Volta para o Portfólio
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Use o mouse ou arraste para mover o retângulo!",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: BrickBreakerGame(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}