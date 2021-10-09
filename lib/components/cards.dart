import 'package:flutter/material.dart';

class DockingBaysCards extends StatelessWidget {
  const DockingBaysCards({
    required this.availability,
    required this.dockingBay,
    required this.howMuchLonger,
  });
  final String availability;
  final String dockingBay;
  final String howMuchLonger;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      color: Colors.grey[200],
      child: Row(children: [
          Flexible(flex: 1, child: Container(color: 
          availability == 'Free'
                  ? Colors.green
                  : availability == 'Reserved'
                      ? Colors.orange
                      : Colors.pink,)),
          Flexible(flex: 5, child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Docking Bay" + dockingBay,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black)),
              SizedBox(height: 2),
              Text(availability,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black)),
              SizedBox(height: 2),
              availability == 'Free'
                  ? Text("No Containers Inbound",
                      style: TextStyle(fontSize: 12)) // Free
                  : availability == 'Reserved'
                      ? Text("Container arriving at ~" + howMuchLonger,
                          style: TextStyle(fontSize: 12)) // Reserved
                      : Text("Free at ~" + howMuchLonger,
                          style: TextStyle(fontSize: 12)), // Not Free
            ],
          ),
        )]));
  }
}
