import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/engine/health_memory.dart';
import '../../../core/user/user_profile.dart';
import '../widgets/health_score_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/ai_insight_card.dart';
import '../widgets/recent_activity_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  String getHealthTip() {
    List<String> tips = [];

    if (HealthMemory.healthScore < 60) {
      tips.add("⚠️ Your health needs attention today.");
    } else if (HealthMemory.healthScore < 80) {
      tips.add("💙 You're improving. Keep following healthy habits.");
    } else {
      tips.add("🎉 Excellent! Keep maintaining your healthy lifestyle.");
    }

    if (HealthMemory.issues.contains("Vitamin D Deficiency")) {
      tips.add("☀️ Get 20 minutes of sunlight.");
    }

    if (HealthMemory.issues.contains("Vitamin B12 Deficiency")) {
      tips.add("🥛 Include Vitamin B12 rich foods.");
    }

    if (HealthMemory.issues.contains("High Blood Sugar")) {
      tips.add("🥗 Avoid sugary foods today.");
    }

    if (HealthMemory.issues.contains("High Cholesterol")) {
      tips.add("🥦 Eat more fibre-rich meals.");
    }

    if (HealthMemory.issues.contains("High Blood Pressure")) {
      tips.add("🧂 Reduce your salt intake.");
    }

    return tips.join("\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      appBar: null,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      getGreeting(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      UserProfile.name,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1F2937),
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      "Welcome back to SATARKA",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),

                Container(
                  width: 58,
                  height: 58,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),

                  child: const Icon(
                    Icons.person_outline_rounded,
                    size: 30,
                    color: Color(0xff5B8DEF),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            HealthScoreCard(),

            const SizedBox(height: 28),

            QuickActionsGrid(
              onRefresh: () {
                setState(() {});
              },
            ),

            const SizedBox(height: 28),

            AIInsightCard(),

            const SizedBox(height: 28),

            RecentActivityCard(),

            const SizedBox(height: 40),

            const RecentActivityCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
