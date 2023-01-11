import 'package:flutter/material.dart';
import 'package:food_app/bars/screenA.dart';
import 'package:food_app/bars/screenB.dart';
import 'package:food_app/bars/screenC.dart';
import 'package:food_app/bars/screenD.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key,}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{

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
          selectedItemColor: Color(0xC4C0B205),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: "Food Items"),
            BottomNavigationBarItem(icon: Icon(Icons.reorder_outlined), label: "Order"),
            BottomNavigationBarItem(icon: Icon(Icons.payment_outlined), label: "payment"),
          ],
        ),
      ),
    );
  }
}
