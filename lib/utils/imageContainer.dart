import 'package:Home/utils/forms.dart';
import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';
import 'forms.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
      height: 300.0,
      width: 500.0,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Image(
              image: NetworkImage("https://cdn.dribbble.com/users/330915/screenshots/9080033/media/f67ff8134295d7179e6215bd84264665.gif"),
              fit: BoxFit.fill,
            ),
          ),
        /*  Padding(
            padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 
                ],
              ),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NormalForm(Icons.search, "What are you looking for"),
            ),
          )
        ],
      ),
    );
  }
}
