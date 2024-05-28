import 'package:flutter/material.dart';
import 'package:hutech_project/pages/category/category_screen.dart';
import 'package:hutech_project/pages/home/home_screen.dart';
import 'package:hutech_project/pages/profile/profile_screen.dart';
class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex=0;

  List<Widget> pages = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState(() {
            _currentIndex=newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.category)),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
