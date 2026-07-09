import '../../auth/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/theme/app_theme.dart';
import '../model/onboarding_model.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (isLastPage) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
      return;
    }

    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,

                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == onboardingData.length - 1;
                  });
                },

                itemBuilder: (context, index) {
                  return OnboardingPage(model: onboardingData[index]);
                },
              ),
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: onboardingData.length,

              effect: ExpandingDotsEffect(
                activeDotColor: AppTheme.primary,
                dotColor: Colors.grey.shade300,
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 3,
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: nextPage,

                  child: Text(isLastPage ? "Get Started" : "Next"),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
