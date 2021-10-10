import 'package:flutter/material.dart';
import 'package:hackathon/firebaseFuncs.dart';
import 'package:hackathon/warehouse_app/components/DockingBayCards.dart';
import 'package:hackathon/warehouse_app/components/warehouseCards.dart';
import 'package:hackathon/warehouse_app/warehouseModel.dart';
import 'package:sticky_headers/sticky_headers.dart';

class AllWarehouse extends StatefulWidget {
  const AllWarehouse({
    Key? key,
  }) : super(key: key);

  @override
  _AllWarehouseState createState() => _AllWarehouseState();
}

class _AllWarehouseState extends State<AllWarehouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllWarehouse(),
    );
  }

  Widget AllWarehouse() {
    return Column(children: [
      SizedBox(
        height: 50,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Text("Warehouse Statuses",
                  style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),

      Flexible(
          fit: FlexFit.tight,
          child: FutureBuilder(
              future: getListOfContainers('a'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else {
                  print(snapshot.data as List<Warehouse>);
                  return Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: GridView.count(
                            clipBehavior: Clip.none,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 20.0,
                            crossAxisCount: 1,
                            childAspectRatio: 3.7,
                            children: [
                              WarehouseCards(warehouse: "A"),
                              WarehouseCards(warehouse: "B"),
                              WarehouseCards(warehouse: "C"),
                              WarehouseCards(warehouse: "D"),
                              WarehouseCards(warehouse: "E"),
                            ],
                          )));
                }
              }))
    ]);
  }
}
