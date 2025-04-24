import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _locationAccess = true;
  bool _dataCollection = false;
  bool _adPersonalization = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Settings"),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Manage your privacy preferences below.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            _buildSwitchTile(
              title: "Location Access",
              subtitle: "Allow access to your location for better service.",
              value: _locationAccess,
              onChanged: (val) => setState(() => _locationAccess = val),
            ),
            _buildSwitchTile(
              title: "Data Collection",
              subtitle: "Allow the app to collect anonymous usage data.",
              value: _dataCollection,
              onChanged: (val) => setState(() => _dataCollection = val),
            ),
            _buildSwitchTile(
              title: "Ad Personalization",
              subtitle: "Use your data to show personalized ads.",
              value: _adPersonalization,
              onChanged: (val) => setState(() => _adPersonalization = val),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // TODO: Save preferences to backend or local storage
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Privacy settings updated")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      activeColor: Colors.blueAccent,
      value: value,
      onChanged: onChanged,
    );
  }
}
