import '../screens/week_picker.dart';

import '../screens/home_screen.dart';
import '../screens/statisticsScreen.dart';
import 'package:flutter/material.dart';
class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  //List<Widget> _pages;
  PageController _pageController;
  int _selectedPageIndex =0;
  List<Widget> _pages = [
      HomeScreen(),
      StatisticsScreen(), 
      WeekPicker(), 
    ];

  @override
  void initState() {
    super.initState();
    _pageController=PageController(initialPage: _selectedPageIndex);
    
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
  void onPageChanged(int page) {
    setState(() {
      this._selectedPageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _pages[_selectedPageIndex]['pages'],
      body: PageView(
        children: _pages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Color.fromRGBO(237,73,103, 1),
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_rounded),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Reports',
          ),
        ],
      ),
    );
  }
  
}
