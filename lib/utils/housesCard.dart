import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'TextStyles.dart';
import 'consts.dart';
import 'package:Home/screens/OverViewScreen.dart';

class HousesCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final String rate;
  final int bedrooms;
  final String type;

 HousesCard(this.imageUrl, this.name, this.location,this.rate,this.bedrooms,this.type);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OverViewPage(this.name, this.rate,
                  this.location, this.bedrooms, this.type, this.imageUrl),
            ));
      },
          child: Padding(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(height: 20,),
                   Row(
                   children: <Widget>[
                         NormalText('budget : ', kgreyDark, 16),
                   Container(
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: kpink2,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
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
                 SizedBox(height: 10,),
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
                                SizedBox(width: 8,),
                                BoldText(bedrooms.toString(), 15.0, kwhite)

                              ],
                            ),
                          ),
                         ],
                       ),
                        SizedBox(height: 10,),
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
                                SizedBox(width: 8,),
                                BoldText(type, 15.0, kwhite)

                              ],
                            ),
                          ),
                         ],
                       ),
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
