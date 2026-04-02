import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      height: size.height * 0.7,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: isMobile 
        ? Column(mainAxisAlignment: MainAxisAlignment.center, children: _content(context, isMobile))
        : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: _content(context, isMobile)),
    );
  }

  List<Widget> _content(BuildContext context, bool isMobile) {
    return [
      Expanded(
        flex: isMobile ? 0 : 1,
        child: Column(
          crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Olá, eu sou Nicolas!", 
              style: TextStyle(fontSize: isMobile ? 32 : 48, fontWeight: FontWeight.bold),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
            const SizedBox(height: 10),
            const Text("Aprendiz de soluções digitais", style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text("Ver Meus Projetos")),
          ],
        ),
      ),
      if (!isMobile) const SizedBox(width: 50),
      CircleAvatar(
        radius: isMobile ? 80 : 120,
        backgroundImage: const AssetImage("assets/perfil.jpg"),
      ),
    ];
  }
}