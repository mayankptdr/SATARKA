import 'package:flutter/material.dart';

import '../../../core/engine/health_memory.dart';

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final previous = HealthMemory.previousHealthScore;
    final current = HealthMemory.healthScore;

    final difference = current - previous;

    Color scoreColor;

    IconData trendIcon;

    String title;

    if (difference > 0) {
      scoreColor = Colors.green;
      trendIcon = Icons.trending_up;
      title = "Health Improved";
    } else if (difference < 0) {
      scoreColor = Colors.red;
      trendIcon = Icons.trending_down;
      title = "Health Declined";
    } else {
      scoreColor = Colors.orange;
      trendIcon = Icons.trending_flat;
      title = "No Major Change";
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Health Comparison"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Card(
              elevation: 3,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Column(
                      children: [
                        const Text(
                          "Previous",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "$previous",
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Icon(trendIcon, color: scoreColor, size: 45),

                    Column(
                      children: [
                        const Text(
                          "Current",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "$current",
                          style: TextStyle(
                            fontSize: 42,
                            color: scoreColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 3,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    Icon(trendIcon, color: scoreColor, size: 60),

                    const SizedBox(height: 15),

                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: scoreColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      difference >= 0
                          ? "+$difference Points"
                          : "$difference Points",
                      style: TextStyle(
                        fontSize: 34,
                        color: scoreColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 3,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Detected Health Issues",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    if (HealthMemory.issues.isEmpty)
                      const Text("No major health issues detected 🎉")
                    else
                      ...HealthMemory.issues.map(
                        (issue) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),

                          child: Row(
                            children: [
                              const Icon(Icons.warning, color: Colors.orange),

                              const SizedBox(width: 10),

                              Expanded(child: Text(issue)),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              color: Colors.blue.shade50,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    const Text(
                      "AI Summary",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      difference > 0
                          ? "Excellent progress! Your overall health score has improved compared to the previous report. Keep following your healthy routine."
                          : difference < 0
                          ? "Your health score has decreased. We recommend consulting your doctor and following the suggested lifestyle improvements."
                          : "Your health score remains stable. Continue maintaining a healthy lifestyle.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
