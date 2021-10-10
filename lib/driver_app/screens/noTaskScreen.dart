import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon/driver_app/components/containerCards.dart';
import 'package:hackathon/driver_app/screens/allocateTaskScreen.dart';
import 'package:hackathon/warehouse_app/components/currentTaskDriverView.dart';
import 'package:hackathon/warehouse_app/components/currentTaskWarehouseView.dart';
import 'package:url_launcher/url_launcher.dart';

class NoTaskScreen extends StatefulWidget {
  const NoTaskScreen(
      {Key? key,
      required this.dockingBay,
      required this.driverName,
      required this.carPlate,
      required this.readyAt,
      required this.latitude,
      required this.longitude,
      required this.driverPhoneNumber})
      : super(key: key);

  final String dockingBay;
  final String driverName;
  final String carPlate;
  final String readyAt;
  final double latitude;
  final double longitude;
  final String driverPhoneNumber;

  @override
  _NoTaskScreenState createState() => _NoTaskScreenState();
}

class _NoTaskScreenState extends State<NoTaskScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(1.319793, 103.67607), zoom: 14.5);

  late GoogleMapController _googleMapController;
  Set<Marker> markers = Set();

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
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
          title: Text(widget.driverName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          centerTitle: true,
        ),
        body: Stack(children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            // onLongPress: _addMarker,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0,
                  top: 50.0,
                ),
                child: Column(children: [
                  Text("No task allocated",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  SizedBox(height: 15),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50)),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllocateTaskScreen(
                                  driverPhoneNumber: widget.driverPhoneNumber,
                                  containersPending: [
                                    ContainersCards(containerID: "C0005", warehouse: "A"),
                                    ContainersCards(containerID: "C2003", warehouse: "B")

                                  ]))),
                      child: const Text("Allocate"))
                ])),
          )
        ]));
  }
}
