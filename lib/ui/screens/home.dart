import 'package:flutter/material.dart';
import 'package:pharmacy/global.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.pink,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DropdownButton(
                        underline: Container(),
                        items: <DropdownMenuItem>[
                          DropdownMenuItem(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: MyColors.blue),
                                children: [
                                  TextSpan(
                                    text: "March",
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(color: MyColors.blue),
                                  ),
                                  TextSpan(text: " 2020")
                                ],
                              ),
                            ),
                          )
                        ],
                        onChanged: (value) {},
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications, color: MyColors.blue),
                        onPressed: () {},
                      )
                    ],
                  ),
                  WeekDaysList(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: MyColors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "To Take",
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: MyColors.pink),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: MyColors.pink),
                          child: IconButton(
                            icon: Icon(Icons.add, color: MyColors.blue),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 15.0),
                            decoration: BoxDecoration(
                              color: MyColors.red,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, 'details'),
                              child: Dismissible(
                                direction: DismissDirection.endToStart,
                                key: Key("$i"),
                                onDismissed: (direction) {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Done!"),
                                    ),
                                  );
                                },
                                background: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  alignment: Alignment.centerRight,
                                  color: MyColors.red,
                                  child: Icon(Icons.check, color: Colors.white),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset("assets/pill.png", height: 35, width: 35),
                                      SizedBox(width: 9),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Pharmacetical Product 250 mg",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle
                                                  .copyWith(
                                                      color: MyColors.blue),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              "1 pill, once per day",
                                              style: TextStyle(
                                                  color: MyColors.blue),
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.timelapse,
                                                    color: MyColors.blue),
                                                Expanded(
                                                  child: Text(
                                                    "09:00 AM",
                                                    style: TextStyle(
                                                      color: MyColors.blue,
                                                    ),
                                                  ),
                                                ),
                                                Icon(Icons.notifications,
                                                    color: MyColors.blue),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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

class WeekDaysList extends StatefulWidget {
  const WeekDaysList({
    Key key,
  }) : super(key: key);

  @override
  _WeekDaysListState createState() => _WeekDaysListState();
}

class _WeekDaysListState extends State<WeekDaysList> {
  int _active;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            setState(() {
              _active = i;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(5.0),
            width: 51,
            decoration: BoxDecoration(
              color: _active == i ? MyColors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.only(right: 25),
            child: Column(
              children: <Widget>[
                Text(
                  "${i + 1}",
                  style: Theme.of(context).textTheme.display1.copyWith(
                        color: _active == i ? Colors.white : MyColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "${weekDays[i]}",
                  style: TextStyle(
                    color: _active == i ? Colors.white : MyColors.blue,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
