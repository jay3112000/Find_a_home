import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';

class RentalCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final String rate;

 RentalCard(this.imageUrl, this.name, this.location,this.rate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          child: Card(
            
        elevation: 10,
            child: Material(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 210,
            height: 190,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 180.0,
                  height: 180.0,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Image(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.fitHeight,
                      )),
                ),
                Column(
                  children: <Widget>[
                      Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BoldText(name, 20.0, kblack),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      NormalText(location, kgreyDark, 16.0),
                      Icon(
                        Icons.location_on,
                        color: kgreyDark,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      
                    ],
                  ),
                ),
                Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: kpink2,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              color: kwhite,
                              size: 15.0,
                            ),
                            BoldText(rate.toString(), 15.0, kwhite)
                          ],
                        ),
                      ),
                  ],
                ),
               
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
