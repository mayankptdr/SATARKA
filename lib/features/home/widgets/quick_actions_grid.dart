import 'package:flutter/material.dart';
import '../../emergency/presentation/emergency_screen.dart';
import '../../ai/presentation/ai_chat_screen.dart';
import '../../comparison/presentation/comparison_screen.dart';
import '../../medication/presentation/medicine_screen.dart';
import '../../report/presentation/report_screen.dart';
import '../../settings/presentation/settings_screen.dart';
import '../../symptom_checker/presentation/symptom_screen.dart';
import '../../timeline/presentation/timeline_screen.dart';

import 'action_tile.dart';

class QuickActionsGrid extends StatelessWidget {
  final VoidCallback onRefresh;

  const QuickActionsGrid({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 1.0,
      ),

      children: [
        // AI
        ActionTile(
          icon: Icons.smart_toy_rounded,
          title: "AI Assistant",
          color: const Color(0xff5B8DEF),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AIChatScreen()),
            );
            onRefresh();
          },
        ),

        // Report
        ActionTile(
          icon: Icons.description_rounded,
          title: "Report",
          color: const Color(0xffFF7A9E),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ReportScreen()),
            );
            onRefresh();
          },
        ),

        // Symptoms
        ActionTile(
          icon: Icons.health_and_safety,
          title: "Symptoms",
          color: Colors.orange,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SymptomScreen()),
            );
            onRefresh();
          },
        ),

        // Medicine
        ActionTile(
          icon: Icons.medication,
          title: "Medicine",
          color: Colors.green,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MedicineScreen()),
            );
            onRefresh();
          },
        ),

        // Timeline
        ActionTile(
          icon: Icons.timeline,
          title: "Timeline",
          color: Colors.deepPurple,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TimelineScreen()),
            );
            onRefresh();
          },
        ),

        // Compare
        ActionTile(
          icon: Icons.compare_arrows,
          title: "Compare",
          color: Colors.red,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ComparisonScreen()),
            );
            onRefresh();
          },
        ),

        // Settings
        ActionTile(
          icon: Icons.settings_rounded,
          title: "Settings",
          color: const Color(0xff5B8DEF),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
            onRefresh();
          },
        ),

        // Emergency
        ActionTile(
          icon: Icons.emergency_rounded,
          title: "Emergency",
          color: Colors.red,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EmergencyScreen()),
            );

            onRefresh();
          },
        ),
      ],
    );
  }
}
