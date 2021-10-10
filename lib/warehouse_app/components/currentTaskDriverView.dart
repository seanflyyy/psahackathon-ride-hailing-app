import 'package:flutter/material.dart';

class CurrentTaskDriverView extends StatelessWidget {
  const CurrentTaskDriverView({
    required this.arrivalTime,
    required this.warehouse,
    required this.startTime,
    required this.dockingBay,
  });
  final String arrivalTime;
  final String warehouse;
  final String startTime;
  final String dockingBay;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.white.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("Current Task",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black)),
          SizedBox(height: 20),
                      Text("Scheduled to arrive at",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black)),
          SizedBox(height: 4),
          Text(arrivalTime,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blue)),
          SizedBox(height: 18),
          Row(children: [
            Text("Warehouse: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black)),
              Text(warehouse,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black)),
          ],),
          SizedBox(height: 4),
          Row(children: [
            Text("Docking Bay: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black)),
              Text(dockingBay,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black)),
          ],),
          SizedBox(height: 4),
          Row(children: [
            Text("Start Time: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black)),
              Text(startTime,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black)),
          ],),
          
          
        ],
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(color: kBorderLines),
      //   color: Colors.white,
      // ),,
    );
  }
}
