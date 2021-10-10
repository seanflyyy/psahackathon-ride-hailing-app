import 'package:cloud_firestore/cloud_firestore.dart';

class Warehouse {
  Warehouse(
      {required this.arrivalTime,
      required this.currentlyLoading,
      required this.availability,
      required this.driverID,
      required this.latitude,
      required this.longitude});

  late String loadingBay;
  late var arrivalTime;
  late String availability;
  late bool currentlyLoading;
  late String driverID;
  late num latitude;
  late num longitude;

  Warehouse.fromJson(Map<String, dynamic> json, id) {
    loadingBay = id;
    arrivalTime = DateTime.fromMicrosecondsSinceEpoch(json['arrivalTime'].seconds * 1000);
    availability = json['availability'];
    currentlyLoading = json['currentlyLoading'];
    driverID = json['driverID'];
    latitude = json['latitude'];
    longitude = json['longitude'];

    // loadingBay = id;
    // arrivalTime = json['arrivalTime'];
    // availability = json['availability'];
    // currentlyLoading = json['currentlyLoading'];
    // driverID = json['driverID'];
    // latitude = json['latitude'];
    // longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loadingBay'] = this.loadingBay;
    data['longitude'] = this.longitude;
    data['arrivalTime'] = this.arrivalTime;
    data['availability'] = this.availability;
    data['currentlyLoading'] = this.currentlyLoading;
    data['driverID'] = this.driverID;
    data['latitude'] = this.latitude;
    return data;
  }
}
