import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/user/user_service.dart';

import 'features/splash/presentation/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserService.loadUser();

  runApp(const SatarkaApp());
}

class SatarkaApp extends StatelessWidget {
  const SatarkaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SATARKA',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
