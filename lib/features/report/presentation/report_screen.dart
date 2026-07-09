import 'dart:io';
import '../../../core/engine/health_engine.dart';
import '../../../core/engine/health_memory.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../core/services/api_service.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  PlatformFile? selectedFile;

  bool isAnalyzing = false;

  String? analysis;

  Future<void> pickReport() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf", "jpg", "jpeg", "png"],
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
        analysis = null;
      });
    }
  }

  Future<void> analyzeReport() async {
    if (selectedFile == null) return;

    setState(() {
      isAnalyzing = true;
      analysis = null;
    });

    try {
      final result = await ApiService.analyzeReport(File(selectedFile!.path!));

      final health = HealthEngine.calculateHealth(report: result);

      HealthMemory.updateHealth(
        score: health["score"],
        status: health["status"],
        detectedIssues: List<String>.from(health["issues"]),
        report: result,
      );

      HealthMemory.addTimeline(
        "Medical Report Analyzed",
        "Health Score: ${health["score"]}",
      );

      // ==============================
      // Automatic Medicine Suggestion
      // ==============================

      final issues = List<String>.from(health["issues"]);

      if (issues.contains("Vitamin D Deficiency")) {
        HealthMemory.addMedicine("Vitamin D3", "After Breakfast");
      }

      if (issues.contains("Vitamin B12 Deficiency")) {
        HealthMemory.addMedicine("Vitamin B12", "After Lunch");
      }

      if (issues.contains("High Blood Sugar")) {
        HealthMemory.addMedicine("Blood Sugar Monitoring", "Morning");
      }

      if (issues.contains("High Cholesterol")) {
        HealthMemory.addMedicine("Heart Healthy Diet", "Daily");
      }

      setState(() {
        analysis = result;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Analysis Complete • ${health["score"]}/100 Health Score",
          ),
        ),
      );
    } catch (e) {
      setState(() {
        analysis = "❌ ${e.toString()}";
      });
    }

    setState(() {
      isAnalyzing = false;
    });
  }

  Widget sectionCard(String title, String icon, Color color, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$icon  $title",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              content.trim(),
              style: const TextStyle(fontSize: 15, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildAnalysisCards() {
    if (analysis == null) return [];

    final text = analysis!;

    final summary = extractSection(text, "📋 Summary", "✅ Normal Findings");

    final normal = extractSection(
      text,
      "✅ Normal Findings",
      "⚠️ Abnormal Findings",
    );

    final abnormal = extractSection(
      text,
      "⚠️ Abnormal Findings",
      "💡 Recommendations",
    );

    final recommendation = extractSection(
      text,
      "💡 Recommendations",
      "👨‍⚕️ When should",
    );

    final doctor = extractSection(text, "👨‍⚕️", null);

    return [
      sectionCard("Summary", "📋", Colors.blue, summary),

      sectionCard("Normal Findings", "✅", Colors.green, normal),

      sectionCard("Abnormal Findings", "⚠️", Colors.orange, abnormal),

      sectionCard("Recommendations", "💡", Colors.purple, recommendation),

      sectionCard("Doctor Advice", "👨‍⚕️", Colors.red, doctor),
    ];
  }

  String extractSection(String text, String start, String? end) {
    int startIndex = text.indexOf(start);

    if (startIndex == -1) return "";

    startIndex += start.length;

    if (end == null) {
      return text.substring(startIndex).trim();
    }

    int endIndex = text.indexOf(end);

    if (endIndex == -1) {
      return text.substring(startIndex).trim();
    }

    return text.substring(startIndex, endIndex).trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Report Analyzer"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue, width: 2),
              ),

              child: Column(
                children: [
                  const Icon(
                    Icons.description_rounded,
                    size: 70,
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Upload Medical Report",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "PDF • JPG • PNG",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: pickReport,
                    icon: const Icon(Icons.upload_file),
                    label: const Text("Choose Report"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            if (selectedFile != null)
              Card(
                elevation: 3,

                child: ListTile(
                  leading: Icon(
                    selectedFile!.extension == "pdf"
                        ? Icons.picture_as_pdf
                        : Icons.image,
                    color: Colors.red,
                    size: 40,
                  ),

                  title: Text(
                    selectedFile!.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  subtitle: Text(
                    "${(selectedFile!.size / 1024).toStringAsFixed(2)} KB",
                  ),

                  trailing: const Icon(Icons.check_circle, color: Colors.green),
                ),
              ),

            const SizedBox(height: 25),

            SizedBox(
              height: 55,

              child: ElevatedButton.icon(
                onPressed: selectedFile == null || isAnalyzing
                    ? null
                    : analyzeReport,

                icon: isAnalyzing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.auto_awesome),

                label: Text(isAnalyzing ? "Analyzing..." : "Analyze Report"),
              ),
            ),

            const SizedBox(height: 30),

            if (analysis != null) ...buildAnalysisCards(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
