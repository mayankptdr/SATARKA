import 'package:flutter/material.dart';

import '../../../core/engine/health_memory.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    final medicines = HealthMemory.medicines;

    return Scaffold(
      appBar: AppBar(title: const Text("Medicine Reminder"), centerTitle: true),

      body: medicines.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medication_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    "No medicines suggested yet",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Analyze a medical report to get\nAI medicine suggestions.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 18),

                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.medication, color: Colors.white),
                    ),

                    title: Text(
                      medicine["name"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text(medicine["time"]),

                    trailing: Checkbox(
                      value: medicine["taken"] ?? false,
                      onChanged: (value) {
                        setState(() {
                          medicine["taken"] = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
