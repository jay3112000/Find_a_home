



import 'package:Home/screens/Splashscreen.dart';
import 'package:Home/screens/login_phone.dart';
import 'package:flutter/material.dart';
import 'package:Home/screens/Intro_scrren.dart';
import 'dart:async';


import 'package:after_layout/after_layout.dart';
import 'package:Home/screens/Splashscreen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
    runApp(MyApp());
     
}
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Splash(),
          routes:{
           SplashScreen.routeName: (ctx)=>SplashScreen(),
           OnboardingScreen.routeName:(ctx)=>OnboardingScreen(),
           SignupPage.routename:(ctx)=>SignupPage(),
          },

        );
      }
    }
  class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new SplashScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}