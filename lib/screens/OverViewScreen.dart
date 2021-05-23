import 'package:Home/providers/review_provider.dart';
import 'package:Home/screens/review.dart';
import 'package:flutter/material.dart';
import 'package:Home/utils/Buttons.dart';
import 'package:Home/utils/TextStyles.dart';
import 'package:Home/utils/consts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/utils/apartmentCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Home/models/apartments.dart';
import 'package:Home/providers/filter_provider.dart';
import 'package:Home/providers/apartment_provider.dart';
import 'package:Home/models/reviews.dart';
import 'package:Home/services/review_firestore_service.dart';

class OverViewPage extends StatefulWidget {
  static const routename = 'overview';
  final String name;
  final int budget;
  final String address;
  final String type;
  final String bedrooms;
  final String imageurl;
  OverViewPage(this.name, this.budget, this.address, this.bedrooms, this.type,
      this.imageurl);

  _OverViewPageState createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    //final reviewfirestoresrvice = ReviewFirestoreService();
    final apartments = Provider.of<List<Apartments>>(context);
    var ap = Provider.of<Reviewprovider>(context);
    final rev = Provider.of<List<Review>>(context).toList();
   
    return Scaffold(
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image(image: NetworkImage(widget.imageurl)),
            ),
          ),
          Positioned(
            top: 257.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 700,
                child: Scaffold(
                  appBar: TabBar(
                    labelColor: kdarkBlue,
                    labelStyle: TextStyle(
                        fontFamily: "nunito", fontWeight: FontWeight.bold),
                    controller: tabController,
                    indicatorColor: kpink2,
                    tabs: <Widget>[
                      Tab(text: "OverView"),
                      Tab(text: "Location"),
                      Tab(text: "Review"),
                    ],
                  ),
                  backgroundColor: kwhite,
                  body: Stack(
                    children: <Widget>[
                      TabBarView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                BoldText(widget.name, 20.0, kblack),
                                Row(
                                  children: <Widget>[
                                    BoldText("4.5 Stars", 12.0, kpink2),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: kgreyDark,
                                      size: 15.0,
                                    ),
                                    NormalText(widget.address, kgreyDark, 17.0),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: 90.0,
                                      decoration: BoxDecoration(
                                        color: kpink2,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.rupeeSign,
                                            color: kwhite,
                                            size: 15.0,
                                          ),
                                          BoldText(widget.budget.toString(),
                                              20.0, kwhite)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BoldText(
                                        "About this Property", 20.0, kblack),
                                    BoldText("More", 16, kdarkBlue)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NormalText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. ",
                                    kblack,
                                    12.0),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BoldText("Ameneties", 20.0, kblack),
                                    BoldText("More", 16, kdarkBlue),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    equipmentsItem(Icons.wifi, "Wi-Fi"),
                                    equipmentsItem(
                                        Icons.local_parking, "Parking"),
                                    equipmentsItem(Icons.pool, "Pool"),
                                    equipmentsItem(
                                        Icons.restaurant, "Restaurant"),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BoldText("Location", 20.0, kblack),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      "assets/plazamap.png",
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.width -
                                              90,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        BoldText("Reviews", 20.0, kblack),
                                        BoldText("See all", 16, kdarkBlue),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 50.0,
                                          decoration: BoxDecoration(
                                            color: kpink2,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.star,
                                                color: kwhite,
                                                size: 15.0,
                                              ),
                                              BoldText("4.5", 15.0, kwhite),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        NormalText(
                                            "(420 reviews)", kgreyDark, 14),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 1000,
                                      child: ListView.builder(
                                          itemCount: rev.length,
                                          itemBuilder: (context, index) {
                                            Review revi = rev[index];
                                            return reviewProfile(
                                                revi.userid,
                                                revi.review,
                                                DateTime.now().toString());
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        controller: tabController,
                      ),
                    ],
                  ),

                  /*Stack(
                    children: <Widget>[
                      Image.asset("assets/hotel.jpg"),





                    ],

                  ),*/
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[200],
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Reviewadd(widget.name)));
          }),
    );
  }

  Widget reviewProfile(String name, String review, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              child: CircleAvatar(
                backgroundColor: kpink2,
                child: Icon(
                  Icons.person,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            BoldText(name, 16, kblack)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
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
                    Icons.star,
                    color: kwhite,
                    size: 15.0,
                  ),
                  BoldText('4', 15, kwhite)
                  // BoldText(review, 15.0, kwhite),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            NormalText(date, kgreyDark, 12.0)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        NormalText(review, kblack, 12.0),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column equipmentsItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icon,
          color: kpink2,
        ),
        NormalText(text, kdarkBlue, 12)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
