import 'package:flutter/material.dart';
// import 'home_screen.dart';
// import 'profile_screen.dart';
// import 'notification_screen.dart';
// import 'settings_screen.dart';

// class SampleScreen extends StatefulWidget {
//   const SampleScreen({super.key});

//   @override
//   State<SampleScreen> createState() => _MainNavigationScreenState();
// }

// class _MainNavigationScreenState extends State<SampleScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = const [
//     HomeScreen(),
//     NotificationScreen(),
//     ProfileScreen(),
//     SettingsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white54,
//         backgroundColor: const Color(0xFF16213E),
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('authenticate'),
    );
  }
}

