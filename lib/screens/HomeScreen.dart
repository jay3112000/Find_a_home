import 'package:Home/screens/dashboard.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Home/screens/filter_screen.dart';
/*import 'package:lets_head_out/Screens/DashBoard.dart';
import 'package:lets_head_out/utils/TextStyles.dart';
import 'package:lets_head_out/utils/consts.dart';

import 'Notifications.dart';
import 'Orders.dart';
import 'Profile.dart';
import 'SignInPage.dart';
*/
class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cIndex = 0;
  
  PageController _pageController;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _cIndex,
          showElevation: true,
          backgroundColor: Colors.white,
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              activeColor: Colors.pink,
              inactiveColor: Colors.grey,
              title: Text(
                "Home",
                style: TextStyle(fontFamily: "nunito"),
              ),
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.line_style),
              title: Text(
                "Filters",
                style: TextStyle(fontFamily: "nunito"),
                
              ),
              inactiveColor: Colors.grey,
              activeColor: Colors.pink,
              
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text(
                "Notifications",
                style: TextStyle(fontFamily: "nunito"),
              ),
              inactiveColor: Colors.grey,
              activeColor: Colors.pink,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontFamily: "nunito"),
              ),
              inactiveColor: Colors.grey,
              activeColor: Colors.pink,
            )
          ],
          onItemSelected: (index) {
            _incrementTab(index);
          }),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _cIndex = index);
          },
          children: <Widget>[
             Dashboard(),
            FilterScreen(),
          /*  Notifications(),
            Profile(),*/
          ],
        ),
      ),
    );
  }
}
