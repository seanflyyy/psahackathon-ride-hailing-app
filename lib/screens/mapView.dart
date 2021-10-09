import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon/components/currentTask.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(1.3521, 103.8198), zoom: 12.5);

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: const Icon(Icons.center_focus_strong),
      ),
      body: Stack(children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: markers,
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
              child: CurrentTask(
                  arrivalTime: "12:51PM",
                  warehouse: "Gui Circle, Warehouse A",
                  startTime: "12:33PM",
                  dockingBay: "B"),
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
