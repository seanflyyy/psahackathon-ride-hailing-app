import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon/firebaseFuncs.dart';
import 'package:hackathon/haulier_app/models/driverModel.dart';
import 'package:hackathon/warehouse_app/components/currentTaskDriverView.dart';
import 'package:hackathon/warehouse_app/components/currentTaskWarehouseView.dart';

class DockingBayScreen extends StatefulWidget {
  const DockingBayScreen({
    Key? key,
    required this.driverID,
    required this.dockingBay,
    // required this.driverName,
    // required this.carPlate,
    required this.readyAt,
    required this.latitude,
    required this.longitude,
    // required this.driverPhoneNumber
  }) : super(key: key);

  final String driverID;
  final String dockingBay;
  // final String driverName;
  // final String carPlate;
  final String readyAt;
  final double latitude;
  final double longitude;
  // final String driverPhoneNumber;

  @override
  _DockingBayScreenState createState() => _DockingBayScreenState();
}

class _DockingBayScreenState extends State<DockingBayScreen> {
  var _initialCameraPosition;
  @override
  void initState() {
    _initialCameraPosition = CameraPosition(
        target: LatLng(widget.latitude, widget.longitude), zoom: 14.5);
    setState(() {});
  }

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
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Docking Bay " + widget.dockingBay,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getDriverDetails(widget.driverID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                print("hello thereeee");
                print(snapshot.data);
                var driverDeez = snapshot.data as List<Drivers>;

                print("driver data is");
                print(driverDeez);
                return Stack(children: [
                  GoogleMap(
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: (controller) =>
                        _googleMapController = controller,
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
                            WarehouseCurrentTask(
                                dockingBay: widget.dockingBay,
                                driverName: driverDeez[0].driverName,
                                carPlate: driverDeez[0].carPlate,
                                readyAt: widget.readyAt,
                                driverPhoneNumber:
                                    driverDeez[0].phoneNumber.toString()),
                            SizedBox(height: 40),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(15.0)),
                                    primary: Colors.green,
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width, 55)),
                                onPressed: () {},
                                child: Text("Mark as free",
                                    style: TextStyle(fontSize: 20)))
                          ]))),
                ]);
              }
            }));
  }

  // void _addMarker(LatLng pos) {
  //   if (markers.length == 0) {
  //     setState(() {
  //       markers.add(Marker(
  //           markerId: const MarkerId('origin'),
  //           infoWindow: const InfoWindow(title: 'Origin'),
  //           icon: BitmapDescriptor.defaultMarkerWithHue(
  //               BitmapDescriptor.hueGreen),
  //           position: pos));
  //       // _destination = null;
  //     });
  //   } else {
  //     setState(() {
  //       markers.add(Marker(
  //           markerId: const MarkerId('destination'),
  //           infoWindow: const InfoWindow(title: 'Destination'),
  //           icon:
  //               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //           position: pos));
  //       // _destination = null;
  //     });
  //   }
  // }
}
