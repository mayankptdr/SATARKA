import 'package:flutter/material.dart';

import '../../../core/engine/health_memory.dart';

class HealthScoreCard extends StatelessWidget {
  const HealthScoreCard({super.key});

  Color getStatusColor() {
    if (HealthMemory.healthScore >= 90) {
      return Colors.green;
    } else if (HealthMemory.healthScore >= 70) {
      return Colors.orange;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        gradient: const LinearGradient(
          colors: [Color(0xffFF7A9E), Color(0xff5B8DEF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(.18),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        children: [
          const Text(
            "Overall Health Score",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 24),

          Stack(
            alignment: Alignment.center,

            children: [
              SizedBox(
                width: 170,
                height: 170,

                child: CircularProgressIndicator(
                  value: HealthMemory.healthScore / 100,
                  strokeWidth: 12,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),

              Column(
                children: [
                  Text(
                    "${HealthMemory.healthScore}",
                    style: const TextStyle(
                      fontSize: 54,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text("/100", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),

            child: Text(
              HealthMemory.healthStatus,
              style: TextStyle(
                color: getStatusColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 10,
            runSpacing: 10,

            children: HealthMemory.issues.isEmpty
                ? [const Chip(label: Text("Healthy"))]
                : HealthMemory.issues
                      .take(3)
                      .map(
                        (e) =>
                            Chip(backgroundColor: Colors.white, label: Text(e)),
                      )
                      .toList(),
          ),
        ],
      ),
    );
  }
}
