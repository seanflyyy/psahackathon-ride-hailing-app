import 'package:flutter/material.dart';
import 'package:hackathon/components/DockingBayCards.dart';
import 'package:hackathon/driver_app/screens/whatDriverDoingScreen.dart';
import 'package:hackathon/warehouse_app/screens/dockingBayScreen.dart';
import 'package:hackathon/warehouse_app/screens/driversView.dart';
import 'package:hackathon/screens/warehouseScreen.dart';

class DriverStatusCards extends StatelessWidget {
  const DriverStatusCards({
    required this.driverName,
    required this.taskCompletionTime,
    required this.onTask,
    required this.phoneNumber,
    required this.task,
  });
  final String taskCompletionTime;
  final String driverName;
  final bool onTask;
  final num phoneNumber;
  final task;

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
                    color: onTask ? Colors.pink[300] : Colors.green[400])),
            Flexible(
                flex: 20,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(driverName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                      SizedBox(height: 6),
                      onTask
                          ? Text("On Task",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black))
                          : Text("Currently Free",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                      // // Not Free
                      SizedBox(height: 10),
                      onTask
                          ? Text(
                              "Estimated completion at " + taskCompletionTime,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey))
                          : Text("No tasks allocated",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ))
          ])),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WhatDriverDoingScreen(
                    dockingBay: "A",
                    driverName: driverName,
                    phoneNumber: phoneNumber,
                    isThereTask: onTask,
                    task: task,
                    readyAt: taskCompletionTime)));
      },
    );
  }
}
