import 'package:flutter/material.dart';
import '../../../core/engine/health_memory.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final events = HealthMemory.timeline;

    return Scaffold(
      appBar: AppBar(title: const Text("Health Journey"), centerTitle: true),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: events.length,

        itemBuilder: (context, index) {
          final event = events[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.blue,
                    child: const Icon(
                      Icons.health_and_safety,
                      color: Colors.white,
                    ),
                  ),

                  if (index != events.length - 1)
                    Container(
                      width: 3,
                      height: 95,
                      color: Colors.grey.shade300,
                    ),
                ],
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Card(
                  margin: const EdgeInsets.only(bottom: 20),

                  elevation: 3,

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          event["title"].toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          event["subtitle"].toString(),
                          style: TextStyle(color: Colors.grey.shade700),
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 18,
                              color: Colors.grey,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              (event["time"] as DateTime).toString().substring(
                                0,
                                16,
                              ),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
