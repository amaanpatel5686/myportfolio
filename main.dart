import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

// ============================================================
// APP ROOT
// ============================================================
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amaan Patel Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2F6FED),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2F6FED),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ============================================================
// SHARED DATA (current session values)
// ============================================================
class ProfileData {
  static const String name = 'Amaan Patel';
  static const String college = 'CR RAO AIMSCS';
  static const String year = '3rd Year';
  static const String branch = 'CSE (AI/ML)';
  static const String location = 'Hyderabad';
  static const String tagline = 'AI Analyst';
  static const String intro =
      'Aspiring AI Analyst passionate about building intelligent systems '
      'using deep learning and computer vision. I enjoy turning research '
      'ideas into working, real-world applications.';

  static const List<String> languages = ['Python', 'C', 'SQL'];

  static const List<String> technologies = [
    'PyTorch',
    'scikit-learn',
    'Hugging Face',
    'NumPy',
    'Pandas',
    'TensorFlow',
  ];

  static const List<String> interests = [
    'Deep Learning',
    'Computer Vision',
  ];

  static const List<ProjectInfo> projects = [
    ProjectInfo(
      title: 'Real-Time Drowsiness & Fatigue Detection System',
      description:
          'A computer vision system that detects driver drowsiness and '
          'fatigue in real time using facial landmark tracking and alerts '
          'the user before a potential accident.',
      tech: ['Computer Vision', 'PyTorch', 'OpenCV'],
      icon: Icons.remove_red_eye,
    ),
    ProjectInfo(
      title: 'Medical Image Classification via Transfer Learning',
      description:
          'Applied transfer learning on pretrained CNN architectures to '
          'classify medical images, improving diagnostic support accuracy '
          'with limited labeled data.',
      tech: ['PyTorch', 'scikit-learn'],
      icon: Icons.medical_information,
    ),
    ProjectInfo(
      title: 'Hugging Face Vision Transformer (ViT) Fine-Tuner',
      description:
          'Fine-tuned a Vision Transformer (ViT) model from Hugging Face '
          'on a custom image dataset for improved classification '
          'performance.',
      tech: ['Hugging Face', 'PyTorch', 'Transformers'],
      icon: Icons.auto_awesome,
    ),
  ];
}

class ProjectInfo {
  final String title;
  final String description;
  final List<String> tech;
  final IconData icon;

  const ProjectInfo({
    required this.title,
    required this.description,
    required this.tech,
    required this.icon,
  });
}

// ============================================================
// HOME PAGE
// ============================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xFF2F6FED),
                    child: Icon(Icons.person, size: 70, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    ProfileData.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    ProfileData.tagline,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      _InfoChip(icon: Icons.school, label: ProfileData.college),
                      _InfoChip(
                          icon: Icons.calendar_today,
                          label:
                              '${ProfileData.year} • ${ProfileData.branch}'),
                      _InfoChip(
                          icon: Icons.location_on,
                          label: ProfileData.location),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        ProfileData.intro,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AboutPage()),
                          );
                        },
                        icon: const Icon(Icons.person_outline),
                        label: const Text('About Me'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProjectsPage()),
                          );
                        },
                        icon: const Icon(Icons.work_outline),
                        label: const Text('My Projects'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: const Color(0xFF2F6FED)),
      label: Text(label),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}

// ============================================================
// ABOUT ME PAGE
// ============================================================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Back to Home',
          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ProfileData.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            ProfileData.tagline,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                          const Divider(height: 28),
                          _DetailRow(icon: Icons.school, label: 'College', value: ProfileData.college),
                          _DetailRow(icon: Icons.calendar_today, label: 'Year', value: ProfileData.year),
                          _DetailRow(icon: Icons.account_tree, label: 'Branch', value: ProfileData.branch),
                          _DetailRow(icon: Icons.location_on, label: 'Location', value: ProfileData.location),
                          const SizedBox(height: 12),
                          Text(
                            ProfileData.intro,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _SectionCard(
                    title: 'Programming Languages',
                    icon: Icons.code,
                    items: ProfileData.languages,
                  ),
                  const SizedBox(height: 20),
                  _SectionCard(
                    title: 'Technologies & Frameworks',
                    icon: Icons.build,
                    items: ProfileData.technologies,
                  ),
                  const SizedBox(height: 20),
                  _SectionCard(
                    title: 'Areas of Interest',
                    icon: Icons.star,
                    items: ProfileData.interests,
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back to Home'),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF2F6FED)),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> items;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF2F6FED)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: items
                  .map((item) => SkillChip(label: item))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFFE8EFFD),
      labelStyle: const TextStyle(
        color: Color(0xFF2F6FED),
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none,
      ),
    );
  }
}

// ============================================================
// PROJECTS PAGE
// ============================================================
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Back to Home',
          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int columns;
              if (constraints.maxWidth >= 900) {
                columns = 3;
              } else if (constraints.maxWidth >= 600) {
                columns = 2;
              } else {
                columns = 1;
              }

              return Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ProfileData.projects.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: columns == 1 ? 1.3 : 0.95,
                    ),
                    itemBuilder: (context, index) {
                      return ProjectCard(project: ProfileData.projects[index]);
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to Home'),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectInfo project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EFFD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(project.icon, color: const Color(0xFF2F6FED)),
            ),
            const SizedBox(height: 12),
            Text(
              project.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                project.description,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: project.tech
                  .map((t) => Chip(
                        label: Text(
                          t,
                          style: const TextStyle(fontSize: 11),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        backgroundColor: Colors.grey[200],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}