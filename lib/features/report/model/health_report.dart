class HealthReport {
  final String id;
  final String fileName;
  final String fileType;
  final DateTime uploadDate;

  final String analysis;

  final int healthScore;

  HealthReport({
    required this.id,
    required this.fileName,
    required this.fileType,
    required this.uploadDate,
    required this.analysis,
    required this.healthScore,
  });
}
