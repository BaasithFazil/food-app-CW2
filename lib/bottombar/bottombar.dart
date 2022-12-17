import 'package:flutter/material.dart';
import 'package:food_app/bottombar/screenA.dart';
import 'package:food_app/bottombar/screenB.dart';
import 'package:food_app/bottombar/screenC.dart';
import 'package:food_app/bottombar/screenD.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{


  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const ScreenA(), "title": "Screen A Title"},
    {"screen": const ScreenB(), "title": "Screen B Title"},
    {"screen": const ScreenC(), "title": "Screen C Title"},
    {"screen": const ScreenD(), "title": "Screen B Title"},
  ];


  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedScreenIndex]["screen"],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen A'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Screen B"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Screen C"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Screen D"),
          ],
        ),
      ),
    );

  }

}
