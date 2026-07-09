import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';

class FirstAidScreen extends StatelessWidget {
  const FirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(title: const Text("First Aid Guide"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _guideCard(context, "❤️ Heart Attack", Colors.red, Icons.favorite, [
            "Call emergency services immediately.",
            "Keep the person seated and calm.",
            "Loosen tight clothing.",
            "If prescribed, assist with medication.",
            "Do not leave the person alone.",
          ]),

          const SizedBox(height: 18),

          _guideCard(
            context,
            "🩸 Severe Bleeding",
            Colors.redAccent,
            Icons.bloodtype,
            [
              "Apply firm pressure with a clean cloth.",
              "Raise the injured area if possible.",
              "Do not remove soaked cloth; add another layer.",
              "Seek emergency medical help immediately.",
            ],
          ),

          const SizedBox(height: 18),

          _guideCard(
            context,
            "🔥 Burns",
            Colors.orange,
            Icons.local_fire_department,
            [
              "Cool under running water for 20 minutes.",
              "Do not apply ice or toothpaste.",
              "Cover with a clean non-stick dressing.",
              "Visit a doctor if burn is severe.",
            ],
          ),

          const SizedBox(height: 18),

          _guideCard(context, "🐍 Snake Bite", Colors.green, Icons.pets, [
            "Keep the person calm.",
            "Immobilize the affected limb.",
            "Do not cut or suck the wound.",
            "Reach the nearest hospital immediately.",
          ]),

          const SizedBox(height: 18),

          _guideCard(
            context,
            "🫁 CPR Basics",
            Colors.blue,
            Icons.monitor_heart,
            [
              "Call emergency services.",
              "Place hands in the center of the chest.",
              "Compress hard and fast (100-120/min).",
              "Continue until help arrives.",
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _guideCard(
    BuildContext context,
    String title,
    Color color,
    IconData icon,
    List<String> steps,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                steps.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    "• ${steps[index]}",
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
