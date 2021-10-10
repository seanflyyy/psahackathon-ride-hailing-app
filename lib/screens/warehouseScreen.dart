import 'package:flutter/material.dart';
import 'package:hackathon/components/cards.dart';
import 'package:sticky_headers/sticky_headers.dart';

class GridHeader extends StatefulWidget {
const GridHeader({
    Key? key,
    required this.warehouse,

  }) : super(key: key);

  final String warehouse; 
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
    return Column(children: [
      SizedBox(
        height: 50,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Text("Gul Circle Warehouse " + widget.warehouse,
                  style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),
      Flexible(
          fit: FlexFit.tight,
          child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GridView.count(
                    clipBehavior: Clip.none,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    children: [
                      DockingBaysCards(
                          availability: "Free",
                          dockingBay: "1",
                          howMuchLonger: "Free",
                          warehouse: widget.warehouse),
                      DockingBaysCards(
                          availability: "Reserved",
                          dockingBay: "2",
                          howMuchLonger: "12:55PM",
                          warehouse: widget.warehouse),
                      DockingBaysCards(
                          availability: "Not Free",
                          dockingBay: "3",
                          howMuchLonger: "1:13PM", 
                          warehouse: widget.warehouse),
                      DockingBaysCards(
                          availability: "Free",
                          dockingBay: "4",
                          howMuchLonger: "Free",
                          warehouse: widget.warehouse),
                      DockingBaysCards(
                          availability: "Free",
                          dockingBay: "5",
                          howMuchLonger: "Free",
                          warehouse: widget.warehouse),
                      DockingBaysCards(
                          availability: "Reserved",
                          dockingBay: "6",
                          howMuchLonger: "8:35PM",
                          warehouse: widget.warehouse),
                      DockingBaysCards(
                          availability: "Free",
                          dockingBay: "7",
                          howMuchLonger: "1:13 AM",
                          warehouse: widget.warehouse),
                      DockingBaysCards(
                          availability: "Reserved",
                          dockingBay: "8",
                          howMuchLonger: "4:32AM",
                          warehouse: widget.warehouse),
                    ],
                  ))))
    ]);
  }
}
