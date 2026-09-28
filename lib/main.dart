import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE2E8F0),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: 390,
              height: 1163,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.grey.shade400, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(37),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 44, 24, 36),
                  child: SingleChildScrollView(
                    child: Builder(
                      builder: (context) {
                        final sections = <Widget>[
                          const TopBarWidget(),
                          const ProfileHeaderWidget(),
                          const StatsSectionWidget(),
                          const AboutMeSectionWidget(),
                          const SkillsSectionWidget(),
                          const FeaturedProjectsWidget(),
                          const ContactInfoSectionWidget(),
                        ];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: sections
                              .expand(
                                (widget) => [
                                  widget,
                                  const SizedBox(height: 24),
                                ],
                              )
                              .toList(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 1. TOP BAR
class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          IconButtonBox(icon: Icons.arrow_back_ios_new),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          IconButtonBox(icon: Icons.share),
        ],
      ),
    );
  }
}

class IconButtonBox extends StatelessWidget {
  final IconData icon;

  const IconButtonBox({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFCBD5E1), width: 1),
      ),
      child: Center(
        child: Icon(icon, size: 14, color: const Color(0xFF0F172A)),
      ),
    );
  }
}

// 2. PROFILE HEADER
class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 124,
                height: 124,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.orangeAccent, Colors.pinkAccent],
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(2),
                  child: ClipOval(
                    child: Image.asset('images/avatar.jpg', fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified_rounded,
                    color: Color(0xFF0284C7),
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Alex Rivers',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Lead Mobile Engineer',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE2E8F0).withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Color(0xFF475569),
                ),
                SizedBox(width: 4),
                Text(
                  'Tokyo, Japan',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF334155),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. STATS
class StatsSectionWidget extends StatelessWidget {
  const StatsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 78,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem('148', 'Projects'),
          _buildDivider(),
          _buildStatItem('9 Yrs', 'Experience'),
          _buildDivider(),
          _buildStatItem('4.9 ★', 'Rating', isStar: true),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, {bool isStar = false}) {
    return SizedBox(
      width: 80,
      height: 43,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isStar ? '4.9 ' : value,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isStar
                          ? const Color(0xFFEAB308)
                          : const Color(0xFF0F172A),
                    ),
                  ),
                  if (isStar)
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFEAB308),
                      size: 18,
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 15,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(width: 1, height: 28, color: const Color(0xFFE2E8F0));
  }
}

// 4. ABOUT ME
class AboutMeSectionWidget extends StatelessWidget {
  const AboutMeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            width: 81,
            height: 21,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  letterSpacing: 0,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 336,
            child: Text(
              'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant architectures.',
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: Color(0xFF64748B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 5. SKILLS
class SkillsSectionWidget extends StatelessWidget {
  const SkillsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 144,
            height: 21,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Skills & Expertise',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  letterSpacing: 0,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              SkillChip(
                label: 'Flutter',
                icon: Icons.flutter_dash,
                width: 90,
                bgColor: Color(0xFFE0F2FE),
                textColor: Color(0xFF0284C7),
              ),
              SkillChip(
                label: 'Dart',
                icon: Icons.code,
                width: 76,
                bgColor: Color(0xFFDCFCE7),
                textColor: Color(0xFF16A34A),
              ),
              SkillChip(
                label: 'Clean Arch',
                icon: Icons.layers_outlined,
                width: 118,
                bgColor: Color(0xFFFFE4E6),
                textColor: Color(0xFFE11D48),
              ),
              SkillChip(
                label: 'UI/UX',
                icon: Icons.brush_outlined,
                width: 85,
                bgColor: Color(0xFFF3E8FF),
                textColor: Color(0xFF9333EA),
              ),
              SkillChip(
                label: 'Firebase',
                icon: Icons.local_fire_department_outlined,
                width: 103,
                bgColor: Color(0xFFFEF3C7),
                textColor: Color(0xFFD97706),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final double width;
  final Color bgColor;
  final Color textColor;

  const SkillChip({
    super.key,
    required this.label,
    required this.icon,
    required this.width,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 32,
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

// 6. FEATURED PROJECTS
class FeaturedProjectsWidget extends StatelessWidget {
  const FeaturedProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 147,
            height: 21,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Featured Projects',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  letterSpacing: 0,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ProjectCard(
                title: 'E-Shop Flutter',
                subtitle: 'Mobile App • 2026',
                imagePath: 'images/feature1.jpg',
              ),
              ProjectCard(
                title: 'Crypto Vault',
                subtitle: 'Finance • Clean Arch',
                imagePath: 'images/feature2.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(11),
              topRight: Radius.circular(11),
            ),
            child: SizedBox(
              width: 163,
              height: 85,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 163,
            height: 60,
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                SizedBox(
                  height: 13,
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 7. CONTACT INFO
class ContactInfoSectionWidget extends StatelessWidget {
  const ContactInfoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      child: Column(
        children: const [
          ContactItemRow(
            icon: Icons.alternate_email,
            text: 'Contact Information',
            isHeader: true,
          ),
          Divider(height: 1, color: Color(0xFFF1F5F9)),
          ContactItemRow(
            icon: Icons.email_outlined,
            text: 'alex.rivers@email.com',
          ),
          Divider(height: 1, color: Color(0xFFF1F5F9)),
          ContactItemRow(
            icon: Icons.phone_outlined,
            text: '+81 (90) 1234-5678',
          ),
        ],
      ),
    );
  }
}

class ContactItemRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isHeader;

  const ContactItemRow({
    super.key,
    required this.icon,
    required this.text,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 62,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 18,
                color: isHeader
                    ? const Color(0xFF0F172A)
                    : const Color(0xFF475569),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                color: isHeader
                    ? const Color(0xFF0F172A)
                    : const Color(0xFF334155),
              ),
            ),
          ),
          const Icon(Icons.chevron_right, size: 18, color: Color(0xFF94A3B8)),
        ],
      ),
    );
  }
}
