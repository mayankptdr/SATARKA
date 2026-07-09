import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../profile/presentation/profile_setup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> logoScale;
  late Animation<double> logoFade;

  late Animation<double> welcomeFade;

  late Animation<Offset> titleSlide;
  late Animation<double> titleFade;

  late Animation<double> buttonsFade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    logoScale = Tween<double>(begin: .75, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35, curve: Curves.easeOutBack),
      ),
    );

    logoFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.30)),
    );

    welcomeFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.55)),
    );

    titleSlide = Tween<Offset>(begin: const Offset(0, .35), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.40, 0.72, curve: Curves.easeOut),
          ),
        );

    titleFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.40, 0.72)),
    );

    buttonsFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.70, 1.0)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),

            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Spacer(),

                    ScaleTransition(
                      scale: logoScale,

                      child: FadeTransition(
                        opacity: logoFade,

                        child: Hero(
                          tag: "satarka_logo",

                          child: Image.asset(
                            "assets/logos/logo.png",
                            width: 135,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    FadeTransition(
                      opacity: welcomeFade,

                      child: const Text(
                        "Welcome to",

                        style: TextStyle(
                          fontSize: 22,

                          color: AppTheme.textSecondary,

                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    FadeTransition(
                      opacity: titleFade,

                      child: SlideTransition(
                        position: titleSlide,

                        child: const Text(
                          "Your Health Journey",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 32,

                            fontWeight: FontWeight.bold,

                            color: Color(0xff1F2937),

                            height: 1.2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 55),

                    FadeTransition(
                      opacity: buttonsFade,

                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,

                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 58),

                                backgroundColor: const Color(0xff3568E8),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),

                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,

                                  MaterialPageRoute(
                                    builder: (_) => const ProfileSetupScreen(),
                                  ),
                                );
                              },

                              icon: const Icon(Icons.g_mobiledata, size: 34),

                              label: const Text(
                                "Continue with Google",

                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          SizedBox(
                            width: double.infinity,

                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 58),

                                side: BorderSide(color: Colors.grey.shade400),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),

                              onPressed: () {},

                              icon: const Icon(Icons.phone),

                              label: const Text(
                                "Continue with Phone",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          TextButton(
                            onPressed: () {},

                            child: const Text(
                              "Continue as Guest",

                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    FadeTransition(
                      opacity: buttonsFade,

                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 22),

                        child: Text(
                          "By continuing you agree to our\nTerms & Privacy Policy",

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            color: AppTheme.textSecondary,

                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
