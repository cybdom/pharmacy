import 'package:flutter/material.dart';
import 'package:pharmacy/ui/screens/details.dart';
import 'package:pharmacy/ui/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy UI',
      home: MyHomePage(),
      theme: ThemeData(fontFamily: 'Quicksand'),
      routes: {
        'details': (context) => DetailsScreen(),
      },
    );
  }
}
