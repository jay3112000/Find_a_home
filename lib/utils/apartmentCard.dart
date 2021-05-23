import 'package:Home/providers/apartment_provider.dart';
import 'package:Home/providers/review_provider.dart';
import 'package:Home/screens/OverViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:Home/models/apartments.dart';
import 'package:Home/utils/apartmentCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/providers/filter_provider.dart';
import 'TextStyles.dart';
import 'consts.dart';

class ApartmentCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String location;
  final int rate;
  final String bedrooms;
  final String type;
  bool isfavourite;
  ApartmentCard(this.imageUrl, this.name, this.location, this.rate,
      this.bedrooms, this.type, this.isfavourite);

  @override
  _ApartmentCardState createState() => _ApartmentCardState();
}

class _ApartmentCardState extends State<ApartmentCard> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<SettingsProvider>(context);
    final apartments = Provider.of<ApartmentProvider>(context);
    var ap = Provider.of<Reviewprovider>(context);

    bool fav;
    void setfa() {
      if (widget.isfavourite == true)
        fav = false;
      else
        fav = true;
    }

    String boo = widget.name;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OverViewPage(
                  this.widget.name,
                  this.widget.rate,
                  this.widget.location,
                  this.widget.bedrooms,
                  this.widget.type,
                  this.widget.imageUrl),
            ));
        ap.getname('mahima elanza');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Card(
          elevation: 10,
          child: Material(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
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
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: BoldText(widget.name, 20.0, kblack),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            NormalText(widget.location, kgreyDark, 16.0),
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          NormalText('budget : ', kgreyDark, 16),
                          Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: kpink2,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.rupeeSign,
                                  color: kwhite,
                                  size: 15.0,
                                ),
                                BoldText(widget.rate.toString(), 15.0, kwhite)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          NormalText('bedrooms : ', kgreyDark, 16),
                          Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                              color: kpink2,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.bed,
                                  color: kwhite,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                BoldText(
                                    widget.bedrooms.toString(), 15.0, kwhite)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          NormalText('type : ', kgreyDark, 16),
                          Container(
                            width: 110.0,
                            decoration: BoxDecoration(
                              color: kpink2,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.home,
                                  color: kwhite,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                BoldText(widget.type, 15.0, kwhite)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      IconButton(
                        icon: Icon(
                          widget.isfavourite == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: kpink2,
                        ),
                        onPressed: () {
                          setfa();
                          apartments.setfav(fav, boo);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
