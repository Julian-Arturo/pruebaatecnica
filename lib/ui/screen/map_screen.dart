import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prueba_tecnica/core/utils/utils.dart';
import 'package:prueba_tecnica/data/services/services.dart';
import 'package:prueba_tecnica/ui/screen/screens.dart';
import 'package:prueba_tecnica/ui/widget/loading.dart';
import 'package:prueba_tecnica/ui/widget/widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;
  TextEditingController searchController = TextEditingController();
  CameraPosition cameraPosition = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 10);

  Set<Marker> markers = {};

  Future<void> _getLocation() async {
    //Loading circle
    Loading.loadingCircle(context: context);
    Location? placeLocation = await ServicesLocation.getLocation(
        context: context, text: searchController.text);

    if (placeLocation != null) {
      cameraPosition = CameraPosition(
          target: LatLng(placeLocation.latitude, placeLocation.longitude),
          zoom: 14);
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      markers.clear();
      markers.add(Marker(
          markerId: const MarkerId('Ubicación lugar'),
          position: LatLng(placeLocation.latitude, placeLocation.longitude)));
      setState(() {});
    }
    Navigator.of(context).pop();
  }

  UiUtils utils = UiUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showModal(context);
                },
              );
            }),
            actions: [
              //todo: Cerrar sesion
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SplashScreen()),
                      (route) => false);
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.output_sharp),
              )
            ],
            title: const Center(child: Text('MAPA')),
            backgroundColor: Colors.cyan),

        //Todo: Agregar Google Maps
        body: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: cameraPosition,
                  markers: markers,
                  mapType: MapType.hybrid,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 125,
          child: FloatingActionButton(
            child: const Icon(Icons.location_history_rounded),
            onPressed: () async {
              Position? position =
                  await ServicesLocation.determinePosition(context);
              if (position != null) {
                googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(position.latitude, position.longitude),
                        zoom: 14)));

                markers.clear();

                markers.add(Marker(
                    markerId: const MarkerId('Ubicación Actual'),
                    position: LatLng(position.latitude, position.longitude)));

                setState(() {});
              }
            },
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  ///Ventana de alerta
  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(child: Text('Search Earth')),
        actionsAlignment: MainAxisAlignment.start,
        content: CustomTextField(
          controller: searchController,
          hintText: 'Buscar Ubicación',
          sizeW: utils.screenSize.width * 0.5,
          icon: IconButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (searchController.text.isEmpty) {
                  showSnackBar(context, "El campo no pueda estar vacio");
                } else {
                  await _getLocation();
                  Navigator.pop(context);
                }

                setState(() {
                  searchController.clear();
                });
              },
              icon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
