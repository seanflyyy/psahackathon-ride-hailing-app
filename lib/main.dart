import 'package:flutter/material.dart';
import 'package:hackathon/screens/dockingBayScreen.dart';
import 'package:hackathon/screens/homescreen.dart';
import 'package:hackathon/screens/driversView.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.white,
      ),
      home: GridHeader(warehouse: "A"),
      // home: DockingBayScreen(
      //               dockingBay: "A",
      //               driverName: "Mr John",
      //               carPlate: "SLV5891X",
      //               readyAt: "12:00PM",
      //               latitude: 1.319793,
      //               longitude: 103.67607,
      //               driverPhoneNumber: "90667568"),
      // home: MapScreen(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
