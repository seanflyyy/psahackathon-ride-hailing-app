import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverCurrentTask extends StatelessWidget {
  const DriverCurrentTask(
      {Key? key,
      required this.dockingBay,
      required this.driverName,
      required this.carPlate,
      required this.readyAt,
      required this.startLocation,
      required this.endLocation,
      required this.startLocationNumber,
      required this.endLocationNumber,
      required this.driverPhoneNumber})
      : super(key: key);

  final String dockingBay;
  final String driverName;
  final String carPlate;
  final String readyAt;
  final String startLocation;
  final String endLocation;
  final String startLocationNumber;
  final String endLocationNumber; 
  final String driverPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.pink[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Scheduled to be free at",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey)),
            SizedBox(height: 4),
            Text("~" + readyAt,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400])),
          ],
        ),
        SizedBox(height: 20),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Start",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black)),
                SizedBox(height: 4),
                Text(startLocation,
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                SizedBox(height: 4),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        fixedSize: Size(95, 10)),
                    onPressed: () => launch("tel://" + startLocationNumber),
                    child: const Text("Call")),
              ],
            )),
            Expanded(flex: 1, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Destination",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black)),
                SizedBox(height: 4),
                Text(endLocation,
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                SizedBox(height: 4),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        fixedSize: Size(95, 10)),
                    onPressed: () => launch("tel://" + endLocationNumber),
                    child: const Text("Call")),
              ],
            )),
          ],
        )
      ],
    ));
  }
}
