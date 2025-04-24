import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<String> _notifications = [
    "Attendance marked: April 18, 2025",
    "Fingerprint scanned successfully",
    "Admin approved your leave request",
    "Class schedule updated",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF16213E),
        automaticallyImplyLeading: false, // Remove the back icon and its function
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white12,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.notifications, color: Colors.white),
                title: Text(
                  _notifications[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Adjusted font size for better readability
                    fontWeight: FontWeight.w500, // Adjusted font weight
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
