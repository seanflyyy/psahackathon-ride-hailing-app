import 'package:cloud_firestore/cloud_firestore.dart';

class Drivers {
  Drivers(
      {required this.driverName,
      required this.onTask,
      required this.phoneNumber,
      required this.taskCompletionTime,
      required this.warehouse,
      required this.companyName,
      required this.driverId});

  late String driverName;
  late bool onTask;
  late num phoneNumber;
  late num taskCompletionTime;
  late String warehouse;
  late String companyName;
  late String driverId;

  Drivers.fromJson(Map<String, dynamic> json, uid) {
    driverId = uid;
    driverName = json['driverName'];
    onTask = json['onTask'];
    phoneNumber = json['phoneNumber'];
    taskCompletionTime = json['taskCompletionTime'];
    warehouse = json['warehouse'];
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driverId'] = this.driverId;
    data['location'] = this.driverName;
    data['latitude'] = this.onTask;
    data['longitude'] = this.phoneNumber;
    data['title'] = this.warehouse;
    data['type'] = this.companyName;
    return data;
  }
}
