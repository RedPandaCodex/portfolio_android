import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class LauncherUtils {
  // Tornamos a função estática para usá-la sem precisar instanciar a classe
  static Future<void> openLink(String urlString) async {
    final Uri url = Uri.parse(urlString);
    
    // Tenta abrir a URL
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Erro ao abrir: $urlString');
    }
  }
}