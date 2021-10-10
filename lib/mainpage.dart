import 'package:flutter/material.dart';
import 'package:hackathon/driver_app/driversView.dart';
import 'package:hackathon/haulier_app/screens/homeScreen.dart';
import 'package:hackathon/warehouse_app/screens/allWarehouseScreen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => 
                              DriversView(dockingBay: "5", arrivalTime: "12:53 PM", warehouse: "A", startTime: "11:43 AM", latitude: 1.3190963968807143, longitude: 103.66090453894569, destinationLatitude: 1.3222548068763813, destinationLongitude: 103.6619777258845)));
                    },
                    child: Text("Driver App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DriverStatusScreen()));
                    },
                    child: Text("Haulier App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllWarehouse()));
                    },
                    child: Text("Warehouse App")),
              ],
            )));
  }
}
