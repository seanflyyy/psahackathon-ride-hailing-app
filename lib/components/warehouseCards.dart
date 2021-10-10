import 'package:flutter/material.dart';
import 'package:hackathon/screens/dockingBayScreen.dart';
import 'package:hackathon/screens/driversView.dart';
import 'package:hackathon/screens/warehouseScreen.dart';

class WarehouseCards extends StatelessWidget {
  const WarehouseCards({
    required this.warehouse,
    required this.freeLots,
  });
  final num freeLots; 
  final String warehouse;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                              color: Colors.black)),// Not Free
                    ],
                  ),
                ))
          ])),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GridHeader(warehouse: warehouse)));
      },
    );
  }
}
