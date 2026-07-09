import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text("Privacy Policy"), centerTitle: true),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Privacy Matters",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text(
              "SATARKA is committed to protecting your personal and health information. We collect only the information required to provide AI-powered healthcare assistance.",

              style: TextStyle(fontSize: 16, height: 1.7),
            ),

            SizedBox(height: 25),

            Text(
              "What We Store",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "• Basic profile information\n"
              "• Medical reports uploaded by you\n"
              "• Health score\n"
              "• Medicine reminders\n"
              "• Emergency contacts",

              style: TextStyle(fontSize: 16, height: 1.8),
            ),

            SizedBox(height: 25),

            Text(
              "Your Rights",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "• Access your data\n"
              "• Delete your data\n"
              "• Withdraw consent\n"
              "• Request correction of information",

              style: TextStyle(fontSize: 16, height: 1.8),
            ),

            SizedBox(height: 25),

            Text(
              "DPDP Compliance",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "SATARKA is designed following the principles of India's Digital Personal Data Protection (DPDP) Act, emphasizing consent, transparency, and user control over personal data.",

              style: TextStyle(fontSize: 16, height: 1.7),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
