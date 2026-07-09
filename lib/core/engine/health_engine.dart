class HealthEngine {
  static Map<String, dynamic> calculateHealth({
    required String report,

    List<String> symptoms = const [],
  }) {
    int score = 100;

    List<String> issues = [];

    report = report.toLowerCase();

    bool contains(String text) => report.contains(text);

    if (contains("vitamin d")) {
      score -= 8;
      issues.add("Vitamin D Deficiency");
    }

    if (contains("vitamin b12")) {
      score -= 6;
      issues.add("Vitamin B12 Deficiency");
    }

    if (contains("diabetes") || contains("hba1c") || contains("blood sugar")) {
      score -= 15;
      issues.add("High Blood Sugar");
    }

    if (contains("cholesterol")) {
      score -= 8;
      issues.add("High Cholesterol");
    }

    if (contains("triglycerides")) {
      score -= 5;
      issues.add("High Triglycerides");
    }

    if (contains("blood pressure")) {
      score -= 8;
      issues.add("High Blood Pressure");
    }

    if (contains("thyroid")) {
      score -= 5;
      issues.add("Thyroid Imbalance");
    }

    //------------------------------------
    // Symptoms
    //------------------------------------

    if (symptoms.contains("Fever")) {
      score -= 3;
      issues.add("Fever");
    }

    if (symptoms.contains("Fatigue")) {
      score -= 2;
      issues.add("Fatigue");
    }

    if (symptoms.contains("Headache")) {
      score -= 2;
      issues.add("Headache");
    }

    if (symptoms.contains("Cough")) {
      score -= 2;
      issues.add("Cough");
    }

    if (score < 0) {
      score = 0;
    }

    String status;

    if (score >= 90) {
      status = "Excellent";
    } else if (score >= 75) {
      status = "Good";
    } else if (score >= 60) {
      status = "Average";
    } else if (score >= 40) {
      status = "Needs Attention";
    } else {
      status = "Critical";
    }

    return {"score": score, "status": status, "issues": issues};
  }
}
