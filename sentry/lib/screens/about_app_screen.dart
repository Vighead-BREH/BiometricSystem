import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
              "•Cortes       ,  Marc Ejay\n" 
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
