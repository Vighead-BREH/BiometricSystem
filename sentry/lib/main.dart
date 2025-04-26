import 'package:flutter/material.dart';
import 'package:sentry/screens/signin_screen.dart';
import 'websocket_service.dart'; // Import WebSocket service

void main() {
  listenForScans(); // Start listening for WebSocket messages
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sentry',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const SignInScreen(), // Keep Sign-in Screen as the first page
    );
  }
}
