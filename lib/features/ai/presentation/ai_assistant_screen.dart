import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class AIAssistantScreen extends StatelessWidget {
  const AIAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: AppBar(title: const Text("AI Health Assistant")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "How can I help you today?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Choose one of the options below.",
              style: TextStyle(color: AppTheme.textSecondary),
            ),

            const SizedBox(height: 35),

            _option(context, Icons.chat_rounded, "Health Chat"),

            const SizedBox(height: 15),

            _option(context, Icons.monitor_heart_rounded, "Symptom Checker"),

            const SizedBox(height: 15),

            _option(
              context,
              Icons.description_rounded,
              "Analyze Medical Report",
            ),

            const SizedBox(height: 15),

            _option(context, Icons.medication_rounded, "Medicine Information"),
          ],
        ),
      ),
    );
  }

  Widget _option(BuildContext context, IconData icon, String title) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primary),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
