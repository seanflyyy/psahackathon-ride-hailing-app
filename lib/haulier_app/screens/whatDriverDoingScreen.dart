import 'package:flutter/material.dart';
import 'package:hackathon/components/DockingBayCards.dart';
import 'package:hackathon/components/warehouseCards.dart';
import 'package:hackathon/haulier_app/components/driverStatusCards.dart';
import 'package:hackathon/haulier_app/screens/noTaskScreen.dart';
import 'package:hackathon/haulier_app/screens/onTaskScreen.dart';
import 'package:sticky_headers/sticky_headers.dart';

class WhatDriverDoingScreen extends StatelessWidget {
  const WhatDriverDoingScreen({
    Key? key,
    required this.dockingBay,
    required this.driverName,
    required this.phoneNumber,
    required this.isThereTask,
    required this.task,
    required this.readyAt,
  }) : super(key: key);

  final String dockingBay;
  final String driverName;
  final num phoneNumber;
  final bool isThereTask;
  final String readyAt;
  final task;

  @override
  Widget build(BuildContext context) {
    return isThereTask
        ? OnTaskScreen(
            dockingBay: dockingBay,
            driverName: driverName,
            carPlate: "",
            readyAt: readyAt,
            latitude: 1.319793,
            longitude: 103.67607,
            driverPhoneNumber: phoneNumber.toString())
        : NoTaskScreen(
            dockingBay: dockingBay,
            driverName: driverName,
            carPlate: "",
            readyAt: readyAt,
            latitude: 1.319793,
            longitude: 103.67607,
            driverPhoneNumber: phoneNumber.toString());
  }
}
