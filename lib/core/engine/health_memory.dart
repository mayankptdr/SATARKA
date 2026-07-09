class HealthMemory {
  // ==========================
  // HEALTH DATA
  // ==========================

  static int healthScore = 92;

  static int previousHealthScore = 92;

  static String healthStatus = "Excellent";

  static String lastReport = "";

  static List<String> issues = [];

  // ==========================
  // TIMELINE
  // ==========================

  static List<Map<String, dynamic>> timeline = [];

  // ==========================
  // MEDICINES
  // ==========================

  static List<Map<String, dynamic>> medicines = [];

  static bool hasMedicine(String name) {
    return medicines.any((medicine) => medicine["name"] == name);
  }

  static void addMedicine(String medicine, String timing) {
    if (hasMedicine(medicine)) return;

    medicines.add({"name": medicine, "time": timing, "taken": false});

    addTimeline("Medicine Added", medicine);
  }

  // ==========================
  // UPDATE HEALTH
  // ==========================

  static void updateHealth({
    required int score,
    required String status,
    required List<String> detectedIssues,
    required String report,
  }) {
    previousHealthScore = healthScore;

    healthScore = score;

    healthStatus = status;

    issues = detectedIssues;

    lastReport = report;

    addTimeline("Health Score Updated", "Health Score changed to $score");
  }

  // ==========================
  // TIMELINE
  // ==========================

  static void addTimeline(String title, String subtitle) {
    timeline.insert(0, {
      "title": title,
      "subtitle": subtitle,
      "time": DateTime.now(),
    });
  }

  // ==========================
  // RESET
  // ==========================

  static void clear() {
    healthScore = 100;

    previousHealthScore = 100;

    healthStatus = "Excellent";

    lastReport = "";

    issues.clear();

    medicines.clear();

    timeline.clear();
  }
}
