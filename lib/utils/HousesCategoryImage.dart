import 'package:Home/screens/houses_screen.dart';
import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';

class HousesCategoryImage extends StatelessWidget {
  
  final String city;

  HousesCategoryImage ( this.city);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(HousesScreen.routename),
              child: Container(
          width: 160,
          height: 160,
          child: Stack(
            children: <Widget>[
              Container(
                  width: 160,
                  height: 150,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.all(Radius.circular(15.0)),
                      child: Image(
                        image: AssetImage('lib/assets/house.jpg'),
                        fit: BoxFit.cover,
                      ))),
              Container(
                width: 160,
                height: 160,
                child: Align(
                    alignment: Alignment.center,

                    child: BoldText(city,30,kwhite)),
              )
            ],
          ),
        ),
      );

  }
}
