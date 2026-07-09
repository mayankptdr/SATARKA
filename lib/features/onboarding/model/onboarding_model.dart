import 'package:flutter/material.dart';

class OnboardingModel {
  final IconData icon;
  final String title;
  final String description;

  const OnboardingModel({
    required this.icon,
    required this.title,
    required this.description,
  });
}

final List<OnboardingModel> onboardingData = [
  const OnboardingModel(
    icon: Icons.health_and_safety_rounded,
    title: "Your Health.\nOne Place.",
    description:
        "Store medical records, prescriptions and reports securely in one place.",
  ),

  const OnboardingModel(
    icon: Icons.smart_toy_rounded,
    title: "AI That Knows\nYour Health",
    description:
        "Chat with an AI that understands your reports, medicines, symptoms and health history.",
  ),

  const OnboardingModel(
    icon: Icons.favorite_rounded,
    title: "Stay One\nStep Ahead",
    description:
        "Medicine reminders, wellness insights and emergency support whenever you need it.",
  ),
];
