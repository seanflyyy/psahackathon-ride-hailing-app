import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WarehouseCurrentTask extends StatelessWidget {
  const WarehouseCurrentTask(
      {Key? key,
      required this.dockingBay,
      required this.driverName,
      required this.carPlate,
      required this.readyAt,
      required this.driverPhoneNumber})
      : super(key: key);

  final String dockingBay;
  final String driverName;
  final String carPlate;
  final String readyAt;
  final String driverPhoneNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        // color: Colors.pink[50],
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Truck Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black)),
          SizedBox(height: 4),
          Text(driverName, style: TextStyle(fontSize: 14, color: Colors.black)),
          SizedBox(height: 4),
          Text(carPlate, style: TextStyle(fontSize: 14, color: Colors.black)),
          SizedBox(height: 4),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  fixedSize: Size(95, 10)),
              onPressed: () => launch("tel://" + driverPhoneNumber),
              child: const Text("Call")),
        ],
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700])),
          ],
        ),
      )
    ]));
  }
}
