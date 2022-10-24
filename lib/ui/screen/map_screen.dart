import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;
  TextEditingController _searchController = TextEditingController();
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              //todo: Cerrar sesion
              IconButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: const Icon(Icons.output_sharp),
              )
            ],
            title: const Center(child: Text('MAPA')),
            backgroundColor: Colors.cyan),

        //Todo: Agregar Google Maps
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration:
                      const InputDecoration(hintText: 'Buscar ubicación'),
                  onChanged: ((value) {
                    // ignore: avoid_print
                    print(value);
                  }),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: initialCameraPosition,
                markers: markers,
                mapType: MapType.hybrid,
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 125,
          child: FloatingActionButton(
            child: const Icon(Icons.location_history_rounded),
            onPressed: () async {
              Position position = await _determinePosition();

              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 14)));

              markers.clear();

              markers.add(Marker(
                  markerId: const MarkerId('Ubicación Actual'),
                  position: LatLng(position.latitude, position.longitude)));

              setState(() {});
            },
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Permiso de ubicación denegado");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Los permisos de ubicación están denegados permanentemente');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
