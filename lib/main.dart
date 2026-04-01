import 'package:flutter/material.dart';
import 'package:meu_portfolio/screens/home_view.dart'; // Tela Home

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug"
      title: 'Meu Portfólio',
      
      // Configuração de Tema
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        // Define a fonte padrão para o projeto todo
        fontFamily: 'sans-serif', 
      ),
      
      // A tela inicial do seu app
      home: HomeView(), 
    );
  }
}