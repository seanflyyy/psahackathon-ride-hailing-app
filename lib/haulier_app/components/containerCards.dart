import 'package:flutter/material.dart';

class ContainersCards extends StatelessWidget {
  const ContainersCards({
    required this.containerID,
    required this.warehouse,
  });
  final String containerID;
  final String warehouse;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Row(children: [
            Flexible(flex: 1, child: Container(color: Colors.green[400])),
            Flexible(
                flex: 20,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(containerID,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      // // Not Free
                      SizedBox(height: 10),
                      Text("To Warehouse " + warehouse,
                          style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ))
          ])),
      onTap: () {},
    );
  }
}
