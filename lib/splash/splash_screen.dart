import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hutech_project/pages/dashboard/ui/dashboard_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(
       const Duration(seconds: 3),
            () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hutech Solutions", style: TextStyle(color: Colors.teal,fontSize: 34,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
