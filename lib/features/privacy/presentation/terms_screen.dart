import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms of Use",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text(
              "SATARKA provides AI-assisted health guidance for informational purposes only. It is not a replacement for professional medical advice, diagnosis, or treatment.",
              style: TextStyle(fontSize: 16, height: 1.7),
            ),

            SizedBox(height: 25),

            Text(
              "User Responsibilities",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "• Provide accurate information.\n"
              "• Consult a qualified doctor for emergencies.\n"
              "• Do not rely solely on AI for critical medical decisions.",
              style: TextStyle(fontSize: 16, height: 1.8),
            ),

            SizedBox(height: 25),

            Text(
              "Limitation",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "SATARKA does not guarantee medical accuracy and should always be used alongside professional healthcare services.",
              style: TextStyle(fontSize: 16, height: 1.7),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
