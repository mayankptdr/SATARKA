import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../onboarding/presentation/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  bool showLoading = false;
  bool showStep1 = false;
  bool showStep2 = false;
  bool showStep3 = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    startSequence();
  }

  Future<void> startSequence() async {
    await Future.delayed(const Duration(milliseconds: 3200));

    if (!mounted) return;

    setState(() {
      showLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() => showStep1 = true);

    await Future.delayed(const Duration(milliseconds: 450));

    setState(() => showStep2 = true);

    await Future.delayed(const Duration(milliseconds: 450));

    setState(() => showStep3 = true);

    await Future.delayed(const Duration(milliseconds: 1800));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildStep(bool visible, String text) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 18),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ScaleTransition(
                  scale: _scaleAnimation,

                  child: FadeTransition(
                    opacity: _fadeAnimation,

                    child: Image.asset("assets/logos/logo.png", width: 150),
                  ),
                ),

                const SizedBox(height: 28),

                FadeTransition(
                  opacity: _fadeAnimation,

                  child: const Text(
                    "SATARKA",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Color(0xff1F2937),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  height: 55,

                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Your Personal Health Operating System",

                        textAlign: TextAlign.center,

                        speed: const Duration(milliseconds: 55),

                        textStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Secure • Intelligent • Personal",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff5B8DEF),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 55),

                if (showLoading) ...[
                  const SizedBox(
                    width: 180,
                    child: LinearProgressIndicator(minHeight: 5),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "Initializing...",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 18),

                  buildStep(showStep1, "Secure Storage"),

                  buildStep(showStep2, "Health Engine"),

                  buildStep(showStep3, "Loading Dashboard"),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
