import 'package:flutter/material.dart';
import '../models/project.dart';
import 'project_card.dart';

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectsGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Column(
      children: [
        const Text(
          "Projetos Recentes",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return ProjectCard(project: projects[index]);
          },
        ),
      ],
    );
  }
}