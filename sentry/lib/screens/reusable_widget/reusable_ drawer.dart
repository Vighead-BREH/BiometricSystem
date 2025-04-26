import 'package:flutter/material.dart';
import 'package:sentry/screens/home_screen.dart';
import 'package:sentry/screens/profile_screen.dart';
import 'package:sentry/screens/settings_screen.dart';
import 'package:sentry/screens/signin_screen.dart';
import 'package:sentry/screens/notification_screen.dart';

class ReusableDrawer extends StatelessWidget {
  const ReusableDrawer({super.key});

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF16213E),
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF0F3460)),
            child: Center(
              child: Text(
                "Sentry Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          _drawerItem(Icons.home, "Home", () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
          _drawerItem(Icons.person, "Profile", () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }),
          _drawerItem(Icons.email, "Notifications", () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NotificationScreen()),
            );
          }),
          _drawerItem(Icons.settings, "Settings", () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          }),
          const Divider(color: Colors.white24),
          _drawerItem(Icons.logout, "Logout", () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
          }),
        ],
      ),
    );
  }
}
