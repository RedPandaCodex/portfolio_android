import 'package:flutter/material.dart';
import '../screens/game_view.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      height: isMobile ? null : size.height * 0.7,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: isMobile ? 50 : 0,
      ),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildContent(context, isMobile),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildContent(context, isMobile),
            ),
    );
  }

  // Função que retorna a lista de widgets (Texto + Imagem)
  List<Widget> _buildContent(BuildContext context, bool isMobile) {
    return [
      // Lado Esquerdo: Textos e Botão
      Expanded(
        flex: isMobile ? 0 : 1,
        child: Column(
          crossAxisAlignment: isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Olá, eu sou Nicolas!",
              style: TextStyle(
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
            const SizedBox(height: 15),
            Text(
              "Aprendiz de soluções digitais, apaixonado por design e desenvolvimento de software.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent[700],
                height: 1.5,
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
            const SizedBox(height: 40),

            // BOTÃO DO MINIGAME
            ElevatedButton.icon(
              onPressed: () {
                // Navegação para a tela do jogo
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GamePage()),
                );
              },
              icon: const Icon(Icons.videogame_asset, size: 24),
              label: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text(
                  "JOGAR MINIGAME",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),

      // Espaçamento entre texto e imagem
      if (!isMobile) const SizedBox(width: 50),
      if (isMobile) const SizedBox(height: 50),

      // Lado Direito: Foto de Perfil
      Hero(
        tag: 'profile_pic', // Tag para animação Hero
        child: CircleAvatar(
          radius: isMobile ? 90 : 140,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: isMobile ? 85 : 130,
            backgroundImage: const AssetImage("assets/perfil.jpg"),
            // Se a imagem falhar, mostrar um ícone
            backgroundColor: Colors.grey[200],
          ),
        ),
      ),
    ];
  }
}
