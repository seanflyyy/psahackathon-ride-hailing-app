import 'package:flutter/material.dart';
import 'package:hackathon/components/DockingBayCards.dart';
import 'package:hackathon/components/warehouseCards.dart';
import 'package:hackathon/driver_app/components/driverStatusCards.dart';
import 'package:hackathon/firebaseFuncs.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
  void initState() {
    super.initState();

    // const drivers = extractDrivers();
    const List drivers = [
                      DriverStatusCards(
                          driverName: "James Bond",
                          taskCompletionTime: "12:00 PM",
                          onTask: true,
                          phoneNumber: 81181811,
                          task: "Deliver Container 001 to Warehouse A"),
                      DriverStatusCards(
                          driverName: "Steve Nash",
                          taskCompletionTime: "2:00 PM",
                          onTask: false,
                          phoneNumber: 95944,
                          task: "Deliver Container 3424 to Warehouse A"),
                      DriverStatusCards(
                          driverName: "Frog Nugget",
                          taskCompletionTime: "4:00 PM",
                          onTask: false,
                          phoneNumber: 23717,
                          task: "Deliver Container 34342 to Warehouse A"),
                      DriverStatusCards(
                          driverName: "James Bond",
                          taskCompletionTime: "6:00 PM",
                          onTask: true,
                          phoneNumber: 38383,
                          task: "Deliver Container 2323 to Warehouse A"),
                      DriverStatusCards(
                          driverName: "James Bond",
                          taskCompletionTime: "8:00 PM",
                          onTask: false,
                          phoneNumber: 4848484,
                          task: "Deliver Container 3432 to Warehouse A"),
                    ];


    drivers.forEach((element) {
      if (element.onTask == true) {
        listWidget[1].add(element);
      } else {
        listWidget[0].add(element);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
 title: 
      Text("Driver Status",
                  style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
       ),
      body: DriverStatusScreen(),
    );
  }

  Widget DriverStatusScreen() {
    return 
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
      ListView.builder(
      itemCount: listHeader.length,
      itemBuilder: (context, index) {
        return new StickyHeader(
          header: new Padding(padding: EdgeInsets.fromLTRB(8.0, 10, 0, 0), child: Container(
            height: 40.0,
            color: Colors.white,
            padding: new EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            child: new Text(
              listHeader[index],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                crossAxisCount: 1,
                childAspectRatio: 3.7,
              ),
              itemBuilder: (contxt, indx) {
                return listWidget[index][indx];
              },
            ),
          ),
        ));
      },
      shrinkWrap: true,
    // )
      // Flexible(
      //     fit: FlexFit.tight,
      //     child: Container(
      //         color: Colors.transparent,
      //         width: MediaQuery.of(context).size.width,
      //         child: Padding(
      //             padding: EdgeInsets.all(20.0),
      //             child: GridView.count(
      //               clipBehavior: Clip.none,
      //               mainAxisSpacing: 20.0,
      //               crossAxisSpacing: 20.0,
      //               crossAxisCount: 1,
      //               childAspectRatio: 3.7,
      //               children: 
      //             ))))
    // ]
    );
  }
}
