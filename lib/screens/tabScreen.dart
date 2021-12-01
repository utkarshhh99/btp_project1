import 'dart:io';
import 'package:btp_project1/screens/report_screen.dart';
import '../screens/home_screen.dart';
import '../screens/statisticsScreen.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class TabScreen extends StatefulWidget {
  List<String> userData;
  int s;
  int wo;
  int wa;

  TabScreen(this.userData,this.s,this.wo,this.wa);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  //List user;
  PageController _pageController;
  int _selectedPageIndex =0;
  List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(widget.userData,widget.s,widget.wo,widget.wa),
      StatisticsScreen(),
      ReportScreen(),
    ];
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

  Future<bool> _onWillPop(BuildContext ctx) async {
    return showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          title: new Text(
            'Are you sure?',
            style: TextStyle(
              color: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          content: Text("Do you really want to exit the app?"),
          actions: [
            FlatButton(
              child: Text(
                "No",
                style: TextStyle(
                  color: Color.fromRGBO(237, 73, 103, 1),
                ),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            FlatButton(
                child: Text(
                  "Yes",
                  style: TextStyle(
                    color: Color.fromRGBO(237, 73, 103, 1),
                  ),
                ),
                onPressed: () => exit(0)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>_onWillPop(context),
      child: Scaffold(
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
      ),
    );
  }
  
}
