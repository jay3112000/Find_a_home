import 'package:Home/providers/farm_provider.dart';
import 'package:Home/providers/filter_provider.dart';

import 'package:Home/providers/houses_provider.dart';
import 'package:Home/providers/rental_provider.dart';
import 'package:Home/screens/HomeScreen.dart';
import 'package:Home/screens/OverViewScreen.dart';
import 'package:Home/screens/Splashscreen.dart';
import 'package:Home/screens/apartment_screen.dart';
import 'package:Home/screens/auth_screen.dart';
import 'package:Home/screens/farm_screen.dart';
import 'package:Home/screens/houses_screen.dart';
import 'package:Home/screens/login_phone.dart';
import 'package:Home/screens/rental_screen.dart';
import 'package:Home/services/farm_firestore_services.dart';
import 'package:Home/services/houses_firestore_services.dart';
import 'package:Home/services/rental_firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:Home/screens/Intro_scrren.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:after_layout/after_layout.dart';
import 'package:Home/screens/Splashscreen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Home/providers/apartment_provider.dart';
import 'package:provider/provider.dart';
import 'services/apartments_firestore_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apartmentfirestoreService = ApartmentFirestoreService();
    final farmfirestoreService = FarmFirestoreService();
    final housesfirestoreservice = HousesFirestoreService();
    final rentalsfirestoreservice = RentalFirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApartmentProvider()),
        StreamProvider(
            create: (context) => apartmentfirestoreService.getApartments()),
            ChangeNotifierProvider(create: (context) => ApartmentProvider()),
            StreamProvider(
            create: (context) => apartmentfirestoreService.getfavApartments()),
        ChangeNotifierProvider(create: (context) => FarmProvider()),
        StreamProvider(create: (context) => farmfirestoreService.getFarms()),
        ChangeNotifierProvider(create: (context) => HousesProvider()),
        StreamProvider(create: (context) => housesfirestoreservice.getHouses()),
        ChangeNotifierProvider(create: (context) => RentalProvider()),
        StreamProvider(
            create: (context) => rentalsfirestoreservice.getRentals()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                return SplashScreen();
              }
              return AuthScreen();
            }),
        routes: {
          SplashScreen.routeName: (ctx) => SplashScreen(),
          OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
          SignupPage.routename: (ctx) => SignupPage(),
          ApartmentScreen.routename: (ctx) => ApartmentScreen(),
          FarmScreen.routename: (ctx) => FarmScreen(),
          HousesScreen.routename: (ctx) => HousesScreen(),
          RentalsScreen.routename: (ctx) => RentalsScreen(),
        },
      ),
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
