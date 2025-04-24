import 'package:flutter/material.dart';
import 'package:sentry/screens/privacy_setting_screen.dart';
import 'package:sentry/screens/signin_screen.dart';
import 'package:sentry/screens/about_app_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with SingleTickerProviderStateMixin {
  bool _notifications = true; // ✅ Dummy Toggle Switch for Notifications

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF16213E),
        leading: IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "General Settings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                _settingsTile(
                  title: "Notifications",
                  icon: Icons.notifications,
                  trailing: Switch(
                    value: _notifications,
                    onChanged: (bool value) {
                      setState(() {
                        _notifications = value;
                      });
                    },
                  ),
                ),
                const Divider(color: Colors.white24),

                const Text(
                  "Account Settings",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                _profileOption("Privacy Settings", Icons.email, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacySettingsScreen()),
                  );
                }),
                const Divider(color: Colors.white24),

                const Text(
                  "Other",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                _profileOption("About App", Icons.email, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutAppScreen()),
                  );
                }),
                _settingsTile(
                  title: "Logout",
                  icon: Icons.logout,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignInScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }

  // ✅ Adjusted _settingsTile function with closer icon and title
  Widget _settingsTile({required String title, required IconData icon, Widget? trailing, VoidCallback? onTap}) {
    return Card(
      color: Colors.white12,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust padding here
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }

  Widget _profileOption(String title, IconData icon, VoidCallback onTap) {
    return Card(
      color: Colors.white12,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
        onTap: onTap,
      ),
    );
  }
}

class AbAppScreen extends StatelessWidget {
  const AbAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/logohd.png"), // Replace with your app logo
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Sentry App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Divider(height: 40),
            const Text(
              "About",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sentry is a real-time attendance and notification app using biometric scanning technology. It is designed to help schools track attendance efficiently and notify guardians immediately.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              "Developers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "•Sir Prudenciado, Ryan - Head Developer\n\n"
              "Group 4 - Biometric\n" 
              "•Cortes       ,  Mark Ejay\n" 
              "•Gonzaga   ,  Kristina Cassandra\n"
              "•Bitoon       ,  Harry M.\n"
              "•Lastimoso ,  Elgin Karl\n" 
              "•Mangubat ,  Edrian\n"
              "•Sedillo       ,  Daryll Agustine S.\n"
              "•Otadoy      ,  Kent Jay D.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

