// import 'package:flutter/material.dart';
// import 'package:hackathon/components/DockingBayCards.dart';
// import 'package:sticky_headers/sticky_headers.dart';

// class GridHeader extends StatefulWidget {
//   const GridHeader(
//       {Key? key, required this.warehouse, required this.listOfLB, required})
//       : super(key: key);

//   final String warehouse;
//   final List listOfLB;
//   @override
//   _GridHeaderState createState() => _GridHeaderState();
// }

// class _GridHeaderState extends State<GridHeader> {
//   List<String> listHeader = ['HEADER1'];
//   List<String> listWidget = [
//     'title1',
//     'title2',
//     'title3',
//     'title4',
//   ];
//   List<Widget> freeBays = [];
//   List<Widget> reservedBays = [];
//   List<Widget> notFreeBays = [];

//   @override
//   void initState() {
//     super.initState();
//     widget.listOfLB.forEach((element) {
//       if (element.availability == "Free") {
//         freeBays.add(element);
//       } else if (element.availability == "Not Free") {
//         notFreeBays.add(element);
//       } else {
//         reservedBays.add(element);
//       }
//     });
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text("Warehouse " + widget.warehouse,
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15)),
//         centerTitle: true,
//       ),
//       body: gridHeader(),
//     );
//   }

//   Widget gridHeader() {
//     return Column(children: [
//       // SizedBox(
//       //   height: 50,
//       // ),
//       // Align(
//       //     alignment: Alignment.centerLeft,
//       //     child: Padding(
//       //         padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
//       //         child: Text("Warehouse " + widget.warehouse,
//       //             style:
//       //                 TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),

//       Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//               padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
//               child: Text("Not Free",
//                   style:
//                       TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),
//       Flexible(
//           fit: FlexFit.tight,
//           child: Container(
//               color: Colors.transparent,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: GridView.count(
//                     clipBehavior: Clip.none,
//                     mainAxisSpacing: 20.0,
//                     crossAxisSpacing: 20.0,
//                     crossAxisCount: 2,
//                     childAspectRatio: 2.5,
//                     children: notFreeBays,
//                   )))),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//               padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
//               child: Text("Free",
//                   style:
//                       TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),
//       Flexible(
//           fit: FlexFit.tight,
//           child: Container(
//               color: Colors.transparent,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: GridView.count(
//                     clipBehavior: Clip.none,
//                     mainAxisSpacing: 20.0,
//                     crossAxisSpacing: 20.0,
//                     crossAxisCount: 2,
//                     childAspectRatio: 2.5,
//                     children: freeBays,
//                   )))),
//                   Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//               padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
//               child: Text("Reserved",
//                   style:
//                       TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),
//       Flexible(
//           fit: FlexFit.tight,
//           child: Container(
//               color: Colors.transparent,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: GridView.count(
//                     clipBehavior: Clip.none,
//                     mainAxisSpacing: 20.0,
//                     crossAxisSpacing: 20.0,
//                     crossAxisCount: 2,
//                     childAspectRatio: 2.5,
//                     children: reservedBays,
//                   ))))
//     ]);
//   }
// }

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class GridHeader extends StatefulWidget {
  const GridHeader(
      {Key? key, required this.warehouse, required this.listOfLB, required})
      : super(key: key);

  final String warehouse;
  final List listOfLB;
  @override
  _GridHeaderState createState() => _GridHeaderState();
}

class _GridHeaderState extends State<GridHeader> {
  List<String> listHeader = ['Not Free', 'Free', 'Reserved'];
  List<List<Widget>> listWidget = [[], [], []];

  @override
  void initState() {
    super.initState();
    widget.listOfLB.forEach((element) {
      if (element.availability == "Free") {
        listWidget[0].add(element);
      } else if (element.availability == "Not Free") {
        listWidget[1].add(element);
      } else {
        listWidget[2].add(element);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Warehouse " + widget.warehouse,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        centerTitle: true,
      ),
      body: gridHeader(),
    );
  }

  Widget gridHeader() {
    return new ListView.builder(
      itemCount: listHeader.length,
      itemBuilder: (context, index) {
        return new StickyHeader(
          header: new Padding(padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0), child: Container(
            height: 38.0,
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
                crossAxisCount: 2,
                childAspectRatio: 2.5,
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
  }
}
