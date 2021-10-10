import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon/warehouse_app/components/currentTaskDriverView.dart';

class DriversView extends StatefulWidget {
  const DriversView({
    Key? key,
    required this.dockingBay,
    required this.arrivalTime,
    required this.warehouse,
    required this.startTime,
    required this.latitude,
    required this.longitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
  }) : super(key: key);

  final String dockingBay;
  final String arrivalTime;
  final String warehouse;
  final String startTime;
  final num latitude;
  final num longitude;
  final num destinationLatitude;
  final num destinationLongitude;

  @override
  _DriversViewState createState() => _DriversViewState();
}

class _DriversViewState extends State<DriversView> {
  late GoogleMapController _googleMapController;
  Set<Marker> markers = Set();

  var _initialCameraPosition;
  @override
  void initState() {
    super.initState();
    _initialCameraPosition = CameraPosition(
        target: LatLng(widget.latitude.toDouble(), widget.longitude.toDouble()),
        zoom: 14.5);
    setState(() {});
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: Text("3", style: TextStyle(fontSize: 25.0, color: Colors.white)),
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
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                position: LatLng(
                    widget.latitude.toDouble(), widget.longitude.toDouble())),
            Marker(
                markerId: const MarkerId('origin'),
                infoWindow: const InfoWindow(title: 'Origin'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
                position: LatLng(widget.destinationLatitude.toDouble(),
                    widget.destinationLongitude.toDouble()))
          },
          onLongPress: _addMarker,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.7,
              width: MediaQuery.of(context).size.width,
              color: Colors.white.withOpacity(0.85),
              padding: EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
                top: 35.0,
              ),
              child: CurrentTaskDriverView(
                  arrivalTime: widget.arrivalTime,
                  warehouse: widget.warehouse,
                  startTime: widget.startTime,
                  dockingBay: widget.dockingBay),
            )),
      ]),
    );
  }

  void _addMarker(LatLng pos) {
    if (markers.length == 0) {
      setState(() {
        markers.add(Marker(
            markerId: const MarkerId('origin'),
            infoWindow: const InfoWindow(title: 'Origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos));
        // _destination = null;
      });
    } else {
      setState(() {
        markers.add(Marker(
            markerId: const MarkerId('destination'),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos));
        // _destination = null;
      });
    }
  }
}
