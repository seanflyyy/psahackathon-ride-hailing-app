import 'package:flutter/material.dart';
import 'package:hackathon/screens/dockingBayScreen.dart';
import 'package:hackathon/screens/driversView.dart';

class DockingBaysCards extends StatelessWidget {
  const DockingBaysCards({
    required this.availability,
    required this.dockingBay,
    required this.howMuchLonger,
    required this.warehouse,
  });
  final String availability;
  final String dockingBay;
  final String howMuchLonger;
  final String warehouse;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(10),
            //     topRight: Radius.circular(10),
            //     bottomLeft: Radius.circular(10),
            //     bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(children: [
            Flexible(
                flex: 1,
                child: Container(
                  color: availability == 'Free'
                      ? Colors.green[400]
                      : availability == 'Reserved'
                          ? Colors.orange[300]
                          : Colors.pink[300],
                )),
            Flexible(
                flex: 17,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Docking Bay " + dockingBay,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black)),
                      SizedBox(height: 2),
                      Text(availability,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black)),
                      SizedBox(height: 2),
                      availability == 'Free'
                          ? Text("No Containers Inbound",
                              style: TextStyle(fontSize: 10)) // Free
                          : availability == 'Reserved'
                              ? Text("Container arriving at ~" + howMuchLonger,
                                  style: TextStyle(fontSize: 10)) // Reserved
                              : Text("Free at ~" + howMuchLonger,
                                  style: TextStyle(fontSize: 10)), // Not Free
                    ],
                  ),
                ))
          ])),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DockingBayScreen(
                    dockingBay: dockingBay,
                    driverName: "Mr John Doe",
                    carPlate: "SLV5891X",
                    readyAt: howMuchLonger,
                    latitude: 1.319793,
                    longitude: 103.67607,
                    driverPhoneNumber: "90667568")));
      },
    );
  }
}
