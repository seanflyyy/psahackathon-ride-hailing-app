import 'package:flutter/material.dart';
import 'package:hackathon/components/cards.dart';
import 'package:sticky_headers/sticky_headers.dart';

class GridHeader extends StatefulWidget {
  @override
  _GridHeaderState createState() => _GridHeaderState();
}

class _GridHeaderState extends State<GridHeader> {
  List<String> listHeader = ['HEADER1'];
  List<String> listTitle = [
    'title1',
    'title2',
    'title3',
    'title4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gridHeader(),
    );
  }

  Widget gridHeader() {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          crossAxisCount: 2,
          children: [
            DockingBaysCards(
                availability: "Free", dockingBay: "1", howMuchLonger: "Free"),
            DockingBaysCards(
                availability: "Reserved",
                dockingBay: "2",
                howMuchLonger: "12:55PM"),
            DockingBaysCards(
                availability: "Not Free",
                dockingBay: "3",
                howMuchLonger: "1:13PM"),
            DockingBaysCards(
                availability: "Free", dockingBay: "4", howMuchLonger: "Free"),
            DockingBaysCards(
                availability: "Free", dockingBay: "5", howMuchLonger: "Free"),
            DockingBaysCards(
                availability: "Reserved",
                dockingBay: "6",
                howMuchLonger: "8:35PM"),
            DockingBaysCards(
                availability: "Free",
                dockingBay: "7",
                howMuchLonger: "1:13 AM"),
            DockingBaysCards(
                availability: "Reserved",
                dockingBay: "8",
                howMuchLonger: "4:32AM"),
          ],
        ));
  }
}
