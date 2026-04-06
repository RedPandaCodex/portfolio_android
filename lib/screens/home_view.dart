import 'package:flutter/material.dart';
import '../models/project.dart';
import '../components/hero_section.dart';
import '../components/projects_grid.dart';
import '../components/social_button.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Project> myProjects = [
    Project(
      title: "App Game baseado em Kingdom Hearts",
      description: "Um jogo para android feito em react.",
      imageUrl: "assets/kh-project.png",
      link: "https://github.com/RedPandaCodex/kh_android",
    ),
    Project(
      title: "Site sobre livro Hobbit",
      description: "Site virtual descrevendo o livro o Hobbit.",
      imageUrl: "assets/hobbit.jpg",
      link: "https://github.com/RedPandaCodex/The_Hobbit_React",
    ),
    Project(
      title: "Smart City",
      description:
          "Projeto de monitoramento de cidade inteligente usando react",
      imageUrl: "assets/smartcity.jpeg",
      link: "https://github.com/RedPandaCodex/SmartCity_Retrowave",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(), 
            // Seção de Projetos com fundo para destacar
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: ProjectsGrid(projects: myProjects),
                ),
              ),
            ),

            const SocialButtons(), 
          ],
        ),
      ),
    );
  }
}
