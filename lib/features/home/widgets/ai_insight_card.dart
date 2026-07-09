import 'package:flutter/material.dart';

import '../../../core/engine/health_memory.dart';

class AIInsightCard extends StatelessWidget {
  const AIInsightCard({super.key});

  String getInsight() {
    if (HealthMemory.healthScore >= 90) {
      return "Excellent health! Keep maintaining your healthy lifestyle.";
    }

    if (HealthMemory.issues.contains("Vitamin D Deficiency")) {
      return "Spend 20 minutes in sunlight today and include Vitamin D rich foods.";
    }

    if (HealthMemory.issues.contains("High Blood Sugar")) {
      return "Avoid sugary drinks today and try a 30-minute walk.";
    }

    if (HealthMemory.issues.contains("High Cholesterol")) {
      return "Reduce oily food and increase fibre intake.";
    }

    if (HealthMemory.issues.contains("Vitamin B12 Deficiency")) {
      return "Include milk, eggs or Vitamin B12 supplements in your diet.";
    }

    return "You're doing well. Continue following healthy habits.";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            height: 60,
            width: 60,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xff5B8DEF).withOpacity(.12),
            ),

            child: const Icon(
              Icons.auto_awesome,
              color: Color(0xff5B8DEF),
              size: 30,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "SATARKA AI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Today's Insight",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 12),

                Text(
                  getInsight(),
                  style: const TextStyle(height: 1.6, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
