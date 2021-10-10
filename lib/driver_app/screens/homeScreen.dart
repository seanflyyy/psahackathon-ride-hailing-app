import 'package:flutter/material.dart';
import 'package:hackathon/components/DockingBayCards.dart';
import 'package:hackathon/components/warehouseCards.dart';
import 'package:sticky_headers/sticky_headers.dart';

class DriverStatusScreen extends StatefulWidget {
const DriverStatusScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DriverStatusScreenState createState() => _DriverStatusScreenState();
}

class _DriverStatusScreenState extends State<DriverStatusScreen> {
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
      body: DriverStatusScreen(),
    );
  }

  Widget DriverStatusScreen() {
    return Column(children: [
      SizedBox(
        height: 50,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Text("Warehouse Statuses",
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
                    crossAxisCount: 1,
                    childAspectRatio: 3.7,
                    children: [
                      WarehouseCards(warehouse: "A", freeLots: 6,),
                      WarehouseCards(warehouse: "B", freeLots: 12),
                      WarehouseCards(warehouse: "C", freeLots: 0),
                      WarehouseCards(warehouse: "D", freeLots: 2),
                      WarehouseCards(warehouse: "E", freeLots: 6),
                    ],
                  ))))
    ]);
  }
}
