import 'package:Home/utils/FarmCategoryImage.dart';
import 'package:Home/utils/HousesCategoryImage.dart';
import 'package:Home/utils/RentalCategoryImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Home/utils/BestRatedImage.dart';
import 'package:Home/utils/Buttons.dart';
import 'package:Home/utils/ApartmentsCategoryImage.dart';
import 'package:Home/utils/RecommendationImage.dart';
import 'package:Home/utils/TextStyles.dart';
import 'package:Home/utils/consts.dart';
import 'package:Home/utils/imageContainer.dart';

import 'OverViewScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
 final bool isloading =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           
           ImageContainer(),
          
            Padding(
              padding: const EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),

              child: Column(children: <Widget>[
               /* Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Daily Offers", 20.0, kblack)),
                ),*/
             /*   Container(
                  width: 330,
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      buildContainer(),
                      SizedBox(
                        width: 20,
                      ),
                      buildContainer(),
                      SizedBox(
                        width: 20,
                      ),
                      buildContainer(),
                    ],
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      BoldText("Recommended for you", 20.0, kblack),
                      SizedBox(
                        width: 60,
                      ),
                      BoldText("More", 15.0, kpink),
                      Icon(
                        Icons.navigate_next,
                        color: kpink,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      RecommendationImage("https://lh3.googleusercontent.com/proxy/9hv1fbM5gg2ruANbVUCLJGea7V2P2QSETr3RgrnUrlVr0Kjyw6WVb-f3tLFZvhj-GsMeaO0vKSyljv437b_Pnr-szM6rjYE1wWMTukpobV-hWJJqJWaJs-k82CMBG1GK6XRK2xCmU54VhBu8RnXvTIfR", "Mahima Elanza", "Mansarovar"),
                      RecommendationImage("https://files.propertywala.com/photos/af/J701190016.front-view.2413487l.jpg", "Victoria Heights", "Malviya Nagar"),
                      RecommendationImage("https://newprojects.99acres.com/projects/urbana_jewels/urbana_jewels/images/9e3h79gi.jpeg", "Urbana Group", "C-Scheme"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( top: 10,bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Best Rated Places", 20.0, kblack)),
                ),
                 Container(
                    width: 400,
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        BestRatedImage(
                            "https://i.pinimg.com/originals/23/10/08/23100835e3c8f92725f444156b809fb9.jpg", "Sheraton", "Tonk Road", 4.5),
                        BestRatedImage(
                            "https://media.rightmove.co.uk/dir/crop/10:9-16:9/63k/62080/74956453/62080_NLD180216_IMG_01_0000_max_476x317.jpg", "Oran", "Vaishali Nagar", 4.8),
                        BestRatedImage("https://media.blogto.com/articles/20180918-drakemansion.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70", "Drake", "Bapu Bazar", 5.0),
                      ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Categories", 20.0, kblack)),
                ),
                Row(
                  children: <Widget>[
                    FarmCategoryImage("FARM"),
                    SizedBox(width: 28,),
                    ApartmentCategoryImage("FLATS"),

                  ],
                ),
                
                SizedBox(height: 28,),
                  Row(
                    children: <Widget>[
                     HousesCategoryImage("HOUSE"),
                      SizedBox(width: 28,),

                RentalCategoryImage("RENTAL"),

                    ],

                ),

              ]),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildContainer() {
    return GestureDetector(
    onTap: (){
       
      },
      child: Container(
        width: 320,
        height: 50,
        child: Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.asset(
                        "assets/hotel.jpg",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BoldText("Plaza", 20.5, kblack),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        BoldText("5 Stars", 15.0, korangelite),
                        Icon(
                          Icons.location_on,
                          color: kgreyDark,
                          size: 15.0,
                        ),
                        NormalText("Oran", kgreyDark, 15.0)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: korange,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: kwhite,
                                size: 15.0,
                              ),
                              BoldText("4.5", 15.0, kwhite)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        NormalText("(1024 Reviews)", kgreyDark, 11.0),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    BoldText("Book& Save 30% !", 14.0, Colors.red),
                    SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 90,
                        ),
                        BoldText("More", 12.0, kblack),
                        Icon(
                          Icons.navigate_next,
                          size: 15.0,
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  Row imagesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SquaredIcon(Icons.airplanemode_active, "Flights"),
        SquaredIcon(FontAwesomeIcons.hotel, "Hotels"),
        SquaredIcon(Icons.directions_car, "Cars"),
      ],
    );
  }
}
