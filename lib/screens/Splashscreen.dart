import 'package:Home/screens/HomeScreen.dart';
import 'package:Home/screens/auth_screen.dart';
import 'package:Home/sim_manager.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SplashScreen extends StatefulWidget {
  static const routeName='/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[300],
        body:Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(FontAwesomeIcons.home,color:Colors.white,size: 90,),
              SizedBox(height: 50),
              Text("Alright!",style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),),
              TypewriterAnimatedTextKit(
                text: ["Let's Find You a Home"],
                textStyle: TextStyle(fontSize: 30.0,color:Colors.white),

                speed: Duration(milliseconds: 150),
              )


            ],
          ),
        )

    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:4 ),(){
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return SimScreen();
      }));
    });
  }
}
