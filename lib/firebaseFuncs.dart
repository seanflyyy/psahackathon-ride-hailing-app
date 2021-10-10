import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/haulier_app/models/driverModel.dart';
import 'package:hackathon/warehouse_app/warehouseModel.dart';

Future<List<Drivers>> getListOfDrivers() async {
  var drivers = new List<Drivers>.empty(growable: true);
  var driversRef = FirebaseFirestore.instance
      .collection('hauliers')
      .doc('x')
      .collection('drivers')
      .orderBy('arrivalTime', descending: false);
  var snapshot = await driversRef.get();
  snapshot.docs.forEach((element) {
    // print("data added is");
    // print(element.data());
    drivers.add(Drivers.fromJson(element.data(), element.id));
  });
  return drivers;
}

getListOfContainers(whichWarehouse) async {
  var warehousess = new List<Warehouse>.empty(growable: true);
  var driversRef = FirebaseFirestore.instance
      .collection('warehouses')
      .doc('warehouse_' + whichWarehouse.toString().toLowerCase())
      .collection(whichWarehouse.toString().toLowerCase() + '_loading_bays');

  var snapshot = await driversRef.get();
  // print("snapshot is ");
  // print(snapshot.docs.length);
  snapshot.docs.forEach((element) {
    print(element.data());
  });
  snapshot.docs.forEach((element) {
    // print("hello there");
    // print(element.data());
    warehousess.add(Warehouse.fromJson(
        element.data(), element.id.replaceAll(RegExp(r'[^0-9]'), '')));
  });
  return warehousess;
}

getDriverDetails(driverID) async {
  var warehousess = new List<Warehouse>.empty(growable: true);
  var list_of_hauliers =
      await FirebaseFirestore.instance.collection('hauliers').get();
  var driver;

  list_of_hauliers.docs.forEach((element) {
    print("data is dfsfdsf");
    print(element.data());
  });

  return driver;
}

// getContainer(uid) async {
//   var container_id = FirebaseFirestore.instance.collection('hauliers').doc('x').collection('drivers');
// }

// getCategories() async {
//   var categoriesDict = {};
//   // var categories = new List<Categories>.empty(growable: true);
//   var categoriesRef = FirebaseFirestore.instance.collection('Categories');
//   var snapshot = await categoriesRef.get();
//   snapshot.docs.forEach((element) {

//     categoriesDict.addAll({element.id: .fromJson(element.data())});
//     // categoriesDict.addAll({element.id: element.data()});
//   });
//   // print(categoriesDict);
//   return categoriesDict;
// }

getColor(String type) {
  int iconColor;
  var iconIcon;
  String fontFamily;

  var colorRef = FirebaseFirestore.instance
      .collection('Categories')
      .doc(type)
      .get()
      .then((value) {
    // print("data is is is ${value.data()}");
    iconColor = value.data()?['color'];
    iconIcon = value.data()?['icon'];
    fontFamily = value.data()?['fontFamily'];
    return [iconColor, iconIcon, fontFamily];
    // print("result is ${value.data()}");
  });
}
