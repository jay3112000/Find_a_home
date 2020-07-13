import 'package:Home/screens/apartment_screen.dart';
import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';

class ApartmentCategoryImage extends StatelessWidget {
  final String imgUrl;
  final String city;

  ApartmentCategoryImage (this.imgUrl, this.city);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(ApartmentScreen.routename),
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
                        image: NetworkImage(imgUrl),
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
