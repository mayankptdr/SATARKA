import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class ConsentScreen extends StatefulWidget {
  const ConsentScreen({super.key});

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool analytics = true;
  bool healthData = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text("Consent & Permissions")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Manage Your Consent",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          SwitchListTile(
            value: healthData,
            title: const Text("Health Data Processing"),
            subtitle: const Text(
              "Allow SATARKA to analyze your medical reports.",
            ),
            onChanged: (value) {
              setState(() {
                healthData = value;
              });
            },
          ),

          SwitchListTile(
            value: analytics,
            title: const Text("Anonymous Analytics"),
            subtitle: const Text(
              "Help improve the application with anonymous usage data.",
            ),
            onChanged: (value) {
              setState(() {
                analytics = value;
              });
            },
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Consent preferences saved.")),
              );
            },
            child: const Text("Save Preferences"),
          ),
        ],
      ),
    );
  }
}
