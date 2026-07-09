import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/theme/app_theme.dart';
import '../../first_aid/presentation/first_aid_screen.dart';
import '../../emergency_contacts/presentation/emergency_contacts_screen.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(title: const Text("Emergency"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 10),

            Container(
              width: 170,
              height: 170,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.shade50,
              ),

              child: Center(
                child: Container(
                  width: 120,
                  height: 120,

                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),

                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),

                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("🚨 SOS Activated"),

                            content: const Text(
                              "Emergency mode activated.\n\nIn the final version SATARKA will:\n\n• Call Ambulance\n• Share Live Location\n• Notify Emergency Contacts",
                            ),

                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },

                    child: const Center(
                      child: Text(
                        "SOS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Need Immediate Help?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Quick emergency actions for medical situations.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 35),

            _actionCard(
              context: context,
              icon: Icons.local_hospital,
              color: Colors.red,
              title: "Call Ambulance",
              subtitle: "Dial emergency medical service",
              onTap: () {
                Clipboard.setData(const ClipboardData(text: "108"));

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Emergency Number (108) copied"),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            _actionCard(
              context: context,
              icon: Icons.location_on,
              color: Colors.blue,
              title: "Share Live Location",
              subtitle: "Send your location to trusted contacts",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Live Location feature coming soon"),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            _actionCard(
              context: context,
              icon: Icons.people,
              color: Colors.green,
              title: "Emergency Contacts",
              subtitle: "Manage your emergency contacts",
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EmergencyContactsScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            _actionCard(
              context: context,
              icon: Icons.medical_information,
              color: Colors.orange,
              title: "First Aid Guide",
              subtitle: "Quick medical instructions",
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FirstAidScreen()),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _actionCard({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
      ),
    );
  }
}
