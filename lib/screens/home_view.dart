import 'package:flutter/material.dart';

// --- O Modelo de Dados ---
class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String link;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.link,
  });
}

class HomeView extends StatelessWidget {
  // Lista de projetos
  final List<Project> myProjects = [
    Project(
      title: "App Game baseado em Kingdom Hearts",
      description: "Um jogo para android feito em react.",
      imageUrl: "https://via.placeholder.com/150",
      link: "https://github.com/RedPandaCodex/kh_android",
    ),
    Project(
      title: "Site sobre livro Hobbit",
      description: "Site virtual sobre o livro o Hobbit.",
      imageUrl: "https://via.placeholder.com/150",
      link: "https://github.com/RedPandaCodex/The_Hobbit_React",
    ),
    Project(
      title: "Smart City",
      description:
          "Projeto de monitoramento de cidade inteligente usando react",
      imageUrl: "https://via.placeholder.com/150",
      link: "https://github.com/RedPandaCodex/SmartCity_Retrowave",
    ),
    Project(
      title: "Portfólio Pessoal",
      description: "Este site que você está vendo agora :D",
      imageUrl: "https://via.placeholder.com/150",
      link: "https://github.com/RedPandaCodex/portfolio_android",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navegação beeeem básica
      appBar: AppBar(
        title: Text("Meu Portfólio"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildProjectsSection(context),
            _buildSocialSection(),
          ],
        ),
      ),
    );
  }

  // --- Apresentação ---
  Widget _buildHeroSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      height: size.height * 0.7, // 70% da altura da tela
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _heroContent(isMobile),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _heroContent(isMobile),
            ),
    );
  }

  List<Widget> _heroContent(bool isMobile) {
    return [
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
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
            SizedBox(height: 10),
            Text(
              "Aprendiz de soluções digitais, apaixonado por design e desenvolvimento de software.",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text("Ver Meus Projetos"),
              ),
            ),
          ],
        ),
      ),
      if (!isMobile) SizedBox(width: 50),
      CircleAvatar(
        radius: isMobile ? 80 : 120,
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: 80, color: Colors.white),
      ),
    ];
  }

  // --- Lista de Projetos ---
  Widget _buildProjectsSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: isMobile ? 20 : 100,
      ),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            "Projetos",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myProjects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              return _buildProjectCard(myProjects[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Project project) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              width: double.infinity,
              child: Icon(Icons.code, size: 50, color: Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  project.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                TextButton(onPressed: () {}, child: Text("Saiba mais →")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Redes Sociais ui ui ---
  Widget _buildSocialSection() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () {},
            tooltip: "GitHub",
          ),
          IconButton(
            icon: Icon(Icons.work),
            onPressed: () {},
            tooltip: "LinkedIn",
          ),
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {},
            tooltip: "Email",
          ),
        ],
      ),
    );
  }
}
