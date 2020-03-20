import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharmacy/global.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue,
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.notifications, color: Colors.white),
                    Text(
                      "Medic Name",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "1 Pill a day",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(color: Colors.white),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Image.asset("assets/pill.png"),
                      ),
                    ),
                    Text(
                      "8:00 AM",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(color: Colors.white),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        "$lorem",
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        color: MyColors.pink,
                        child: Text(
                          "Where to buy",
                          style: TextStyle(color: MyColors.blue),
                        ),
                        onPressed: () {
                          setState(() {
                            _visible = true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: 0,
              right: 0,
              bottom: 0,
              top: _visible ? 15 : MediaQuery.of(context).size.height - 70,
              // top: MediaQuery.of(context).size.height - 120,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 55,
                            child: IconButton(
                              icon: Icon(Icons.close, color: MyColors.blue),
                              onPressed: () {
                                setState(() {
                                  _visible = false;
                                });
                              },
                            ),
                          ),
                          Text(
                            "Where to buy",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(color: MyColors.blue),
                          ),
                          SizedBox(width: 55),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            bottom: 70,
                            child: GoogleMap(
                              padding: const EdgeInsets.all(15.0),
                              mapType: MapType.hybrid,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(41, 0),
                              ),
                              onMapCreated: (GoogleMapController controller) {},
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: MyColors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Nice Pharmacy Name 1",
                                          style: Theme.of(context)
                                              .textTheme
                                              .title
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          "Location ABC, Route 123.",
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline
                                              .copyWith(color: Colors.white),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "08:00 AM - 09:00 PM",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: MyColors.red),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.directions,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
