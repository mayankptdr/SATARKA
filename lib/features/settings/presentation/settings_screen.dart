import 'package:flutter/material.dart';

import '../../../core/engine/health_memory.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/user/user_profile.dart';

import '../../privacy/presentation/privacy_policy_screen.dart';
import '../../privacy/presentation/terms_screen.dart';
import '../../privacy/presentation/consent_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(title: const Text("Settings"), centerTitle: true),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xff5B8DEF),
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                UserProfile.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${UserProfile.age} Years • ${UserProfile.gender}",
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text("Privacy Policy"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.gavel),
                  title: const Text("Terms & Conditions"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TermsScreen()),
                    );
                  },
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.verified_user),
                  title: const Text("Consent & Permissions"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ConsentScreen()),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "Health",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.delete_outline, color: Colors.red),
                  title: const Text("Clear Health Data"),
                  subtitle: const Text("Reset score, reports and timeline"),
                  onTap: () {
                    HealthMemory.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Health data cleared.")),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            "About",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.pink),
                  title: Text("SATARKA"),
                  subtitle: Text("Your Personal Health Operating System"),
                ),

                Divider(height: 1),

                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("Version"),
                  subtitle: Text("Prototype v1.0"),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text("Close Settings"),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
