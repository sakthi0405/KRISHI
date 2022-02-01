import 'package:flutter/material.dart';
import 'package:getx_sample/screens/Attendance/HomePage.dart';
import 'package:getx_sample/screens/HomeWork/SearchPage.dart';
import 'package:getx_sample/screens/Materials/CategoryPage.dart';
import 'package:getx_sample/screens/Profile/AccountPage_controller.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex=0;
  List _screens=[HomePage(),SearchPage(),CategoryPage(),AccountPage()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Attendance",
            icon: Icon(Icons.calendar_today),

          ),
          BottomNavigationBarItem(
            label: "Homework",
            icon: Icon(Icons.pages),
          ),
          BottomNavigationBarItem(
            label: "Materials",
            icon: Icon(Icons.folder),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }


}
