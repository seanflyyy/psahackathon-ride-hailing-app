import 'package:flutter/material.dart';
import 'package:hackathon/haulier_app/components/driverStatusCards.dart';
import 'package:hackathon/firebaseFuncs.dart';
import 'package:hackathon/haulier_app/models/driverModel.dart';
import 'package:hackathon/sometingWong.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:intl/intl.dart';

class DriverStatusScreen extends StatefulWidget {
  const DriverStatusScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DriverStatusScreenState createState() => _DriverStatusScreenState();
}

class _DriverStatusScreenState extends State<DriverStatusScreen> {
  List<String> listHeader = ['Curently Free', 'On Task'];
  List<List<Widget>> listWidget = [[], []];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text("Driver Status",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
      body: DriverStatusScreen(),
    );
  }

  Widget DriverStatusScreen() {
    return FutureBuilder(
        future: getListOfDrivers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var drivers = snapshot.data as List<Drivers>;

            var driversCards = [];

            drivers.forEach((element) {
              if (element.companyName == 'x') { // filters out the companies correponding to x 
                driversCards.add(DriverStatusCards(
                    driverName: element.driverName,
                    taskCompletionTime: (DateTime.parse(
                                        element.taskCompletionTime.toString())
                                    .hour %
                                12)
                            .toString() +
                        ":" +
                        DateTime.parse(element.taskCompletionTime.toString())
                            .minute
                            .toString() +
                        (DateTime.parse(element.taskCompletionTime.toString())
                                        .hour /
                                    12 >
                                0
                            ? " PM"
                            : " AM"),
                    onTask: element.onTask,
                    phoneNumber: element.phoneNumber,
                    task: "Deliver Container " +
                        "C0001" +
                        " to Warehouse " +
                        element.warehouse));
              }
            });

            driversCards.forEach((element) {
              if (element.onTask == true) {
                listWidget[1].add(element);
              } else {
                listWidget[0].add(element);
              }
            });


            if (drivers.length == 0)
              return SomeTingWong(text: "Cannot load Drivers");
            else
              return ListView.builder(
                itemCount: listHeader.length,
                itemBuilder: (context, index) {
                  return new StickyHeader(
                      header: new Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child: Container(
                            height: 40.0,
                            color: Colors.transparent,
                            padding: new EdgeInsets.symmetric(horizontal: 12.0),
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              listHeader[index],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )),
                      content: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listWidget[index].length,
                            clipBehavior: Clip.none,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 15.0,
                              crossAxisSpacing: 15.0,
                              crossAxisCount: 1,
                              childAspectRatio: 4.4,
                            ),
                            itemBuilder: (contxt, indx) {
                              return listWidget[index][indx];
                            },
                          ),
                        ),
                      ));
                },
                shrinkWrap: true,
              );
            // displayBasketballCourts(courts);
          }
        });
    // Column(children: [
    //   SizedBox(
    //     height: 50,
    //   ),
    //   Align(
    //       alignment: Alignment.centerLeft,
    //       child: Padding(
    //           padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
    //           child: Text("Driver Status",
    //               style:
    //                   TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),
  }
}
