import 'package:flutter/material.dart';
import 'package:hackathon/driver_app/components/containerCards.dart';
import 'package:url_launcher/url_launcher.dart';

class AllocateTaskScreen extends StatefulWidget {
  const AllocateTaskScreen({
    Key? key,
    required this.driverPhoneNumber,
    required this.containersPending,
  }) : super(key: key);

  final String driverPhoneNumber;
  final List containersPending;

  @override
  _AllocateTaskScreenState createState() => _AllocateTaskScreenState();
}

class _AllocateTaskScreenState extends State<AllocateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text("Back",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ))),
        actions: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      launch("tel://" + widget.driverPhoneNumber);
                    },
                    child: Text("Call",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ))),
        ],
        title: Text("Containers Pending",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        centerTitle: true,
      ),
      body: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: 
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.containersPending.length,
              clipBehavior: Clip.none,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                crossAxisCount: 1,
                childAspectRatio: 4,
              ),
              itemBuilder: (contxt, indx) {
                return widget.containersPending[indx];
              },
            ),
          ),
        ))
    );
  }
}
