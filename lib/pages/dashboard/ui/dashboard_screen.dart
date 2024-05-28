import 'package:flutter/material.dart';
import 'package:hutech_project/widget/bottom_navigatebar_screen.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      bottomNavigationBar: BottomNavigationBarScreen(),
    );
  }
}
