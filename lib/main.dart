import 'package:flutter/material.dart';
import 'package:hutech_project/pages/dashboard/ui/dashboard_screen.dart';
import 'package:hutech_project/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
