import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon/driver_app/components/driverCurrentTask.dart';
import 'package:hackathon/warehouse_app/components/currentTaskDriverView.dart';
import 'package:hackathon/warehouse_app/components/currentTaskWarehouseView.dart';
import 'package:url_launcher/url_launcher.dart';


class OnTaskScreen extends StatefulWidget {
  const OnTaskScreen(
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
  _OnTaskScreenState createState() => _OnTaskScreenState();
}

class _OnTaskScreenState extends State<OnTaskScreen> {
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
          leading: 
          Align(alignment: Alignment.center, child: Padding(
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
            Align(alignment: Alignment.center, child: Padding(
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
            markers: {
              Marker(
                  markerId: const MarkerId('origin'),
                  infoWindow: const InfoWindow(title: 'Origin'),
                  // icon: BitmapDescriptor.defaultMarkerWithHue(
                  //     BitmapDescriptor.hueGreen),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  position: LatLng(widget.latitude, widget.longitude))
            },
            // onLongPress: _addMarker,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height / 2.7,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0,
                  top: 50.0,
                ),
                child: Column(children: [
                  DriverCurrentTask(
                      dockingBay: widget.dockingBay,
                      driverName: widget.driverName,
                      carPlate: widget.carPlate,
                      readyAt: widget.readyAt,
                      startLocation: "Gul Circle, A",
                      endLocation: "Pandan Ave, B",
                      startLocationNumber: "939393",
                      endLocationNumber: "939393",
                      driverPhoneNumber: widget.driverPhoneNumber),
                ])),
          )
        ]));
  }
}
