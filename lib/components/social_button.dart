import 'package:flutter/material.dart';
import '../links/launcher.dart'; // Importe o seu utilitário

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  Widget _buildSocialIcon(IconData icon, String tooltip, VoidCallback onTap) {
    return IconButton(
      icon: Icon(icon),
      constraints: const BoxConstraints(minWidth: 60, minHeight: 60),
      onPressed: onTap,
      tooltip: tooltip,
      iconSize: 30,
      color: Colors.blueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialIcon(Icons.code, "GitHub", () {
            LauncherUtils.openLink("https://github.com/RedPandaCodex");
          }),
          const SizedBox(width: 20),
          _buildSocialIcon(Icons.work, "LinkedIn", () {
            LauncherUtils.openLink("https://linkedin.com/in/seu-perfil");
          }),
          const SizedBox(width: 20),
          _buildSocialIcon(Icons.email, "Email", () {
            LauncherUtils.openLink("mailto:nicolasadrianpessol@gmail.com");
          }),
        ],
      ),
    );
  }
}