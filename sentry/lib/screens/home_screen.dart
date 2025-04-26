import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> announcements = [
    "No school today due to a strong typhoon. Stay safe and indoors!",
    "New library books have arrived. Visit the library once school resumes.",
    "Parent-teacher meeting rescheduled. New date will be announced soon."
  ];

  final List<String> events = [
    "Science Fair - April 25, 2025",
    "Cultural Day - May 5, 2025",
    "Inter-school Football Match - May 12, 2025"
  ];

  final List<String> upcomingEvents = [
    "Midterm Exams - Starting May 20, 2025",
    "Book Reading Day - May 28, 2025"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🏫 Home", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF305F72),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE0EAFC),
              Color(0xFFCFDEF3),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildSection(
                title: "📢 Announcements",
                items: announcements,
                icon: Icons.campaign_rounded,
                color: const Color(0xFF92A9BD),
              ),
              const SizedBox(height: 20),
              _buildSection(
                title: "🎊 Events",
                items: events,
                icon: Icons.event_note_rounded,
                color: const Color(0xFFA2CDB0),
              ),
              const SizedBox(height: 20),
              _buildSection(
                title: "📅 Upcoming Events",
                items: upcomingEvents,
                icon: Icons.calendar_month,
                color: const Color(0xFFF4A261),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> items,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3142),
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...items.map((item) => _buildItemCard(item, icon)).toList(),
        ],
      ),
    );
  }

  Widget _buildItemCard(String content, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF305F72)),
        title: Text(
          content,
          style: const TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D3142),
          ),
        ),
      ),
    );
  }
}
