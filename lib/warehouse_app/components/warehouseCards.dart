import 'package:flutter/material.dart';
import 'package:hackathon/firebaseFuncs.dart';
import 'package:hackathon/haulier_app/components/containerCards.dart';
import 'package:hackathon/sometingWong.dart';
import 'package:hackathon/warehouse_app/components/DockingBayCards.dart';
import 'package:hackathon/warehouse_app/screens/dockingBayScreen.dart';
import 'package:hackathon/warehouse_app/screens/driversView.dart';
import 'package:hackathon/warehouse_app/screens/warehouseScreen.dart';
import 'package:hackathon/warehouse_app/warehouseModel.dart';

class WarehouseCards extends StatelessWidget {
  const WarehouseCards({
    required this.warehouse,
    // required this.freeLots,
  });
  // final num freeLots;
  final String warehouse;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getListOfContainers(warehouse),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            print("data is");
            print(snapshot.data);
            var containers = snapshot.data as List<Warehouse>;
            var containerCards = [];

            containers.forEach((element) {
              containerCards.add(DockingBaysCards(
                  driverID: element.driverID,
                  availability: element.availability == 'free'
                      ? "Free"
                      : element.availability == 'notFree'
                          ? "Not Free"
                          : "Reserved",
                  dockingBay:
                      element.loadingBay,
                  latitude: element.latitude.toDouble(),
                  longitude: element.longitude.toDouble(),
                  howMuchLonger: element.arrivalTime.toString(),
                  warehouse: warehouse));
            });

            var freeLots = containers
                .where((element) => element.availability == "free")
                .toList()
                .length;
            if (containers.length == 0)
              return SomeTingWong(text: "Cannot load warehouses");
            else
              return GestureDetector(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: freeLots > 6
                                ? Colors.green[400]
                                : freeLots == 0
                                    ? Colors.pink[300]
                                    : Colors.orange[300],
                          )),
                      Flexible(
                          flex: 20,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Warehouse " + warehouse,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black)),
                                SizedBox(height: 6),
                                Text(freeLots.toString() + " free lots",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.black)), // Not Free
                              ],
                            ),
                          ))
                    ])),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GridHeader(
                                warehouse: warehouse,
                                listOfLB: containerCards,
                              )));
                },
              );
          }
        });
  }
}
