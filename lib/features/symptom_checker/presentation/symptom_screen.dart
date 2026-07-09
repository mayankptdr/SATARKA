import 'package:flutter/material.dart';

import '../../ai/presentation/ai_chat_screen.dart';

class SymptomScreen extends StatefulWidget {
  const SymptomScreen({super.key});

  @override
  State<SymptomScreen> createState() => _SymptomScreenState();
}

class _SymptomScreenState extends State<SymptomScreen> {
  final List<String> symptoms = [
    "Fever",
    "Headache",
    "Cough",
    "Cold",
    "Sore Throat",
    "Body Pain",
    "Fatigue",
    "Vomiting",
    "Diarrhea",
    "Nausea",
    "Chest Pain",
    "Shortness of Breath",
    "Dizziness",
    "Stomach Pain",
    "Loss of Appetite",
    "Runny Nose",
  ];

  final List<String> selectedSymptoms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Symptom Checker"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select your symptoms",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Choose all symptoms you are currently experiencing.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: symptoms.map((symptom) {
                    final selected = selectedSymptoms.contains(symptom);

                    return FilterChip(
                      label: Text(symptom),
                      selected: selected,
                      onSelected: (value) {
                        setState(() {
                          if (selected) {
                            selectedSymptoms.remove(symptom);
                          } else {
                            selectedSymptoms.add(symptom);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.health_and_safety),
                label: const Text(
                  "Analyze Symptoms",
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: selectedSymptoms.isEmpty
                    ? null
                    : () {
                        final prompt =
                            """
You are SATARKA AI, a healthcare assistant.

The user selected these symptoms:

${selectedSymptoms.join(", ")}

Please answer in the following format:

🩺 Possible Conditions
• ...

⚠️ Urgency Level
(Low / Medium / High)

🏠 Home Care Tips
• ...

👨‍⚕️ When to Visit a Doctor
• ...

🚨 Emergency Warning Signs
• ...

IMPORTANT:
Do not provide a confirmed diagnosis.
Always recommend consulting a healthcare professional if symptoms persist.
Keep the response simple and easy to understand.
""";

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AIChatScreen(initialPrompt: prompt),
                          ),
                        );
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
