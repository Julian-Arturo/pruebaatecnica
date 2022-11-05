// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prueba_tecnica/core/utils/showSnackBar.dart';

class ServicesLocation {
  static Future<Location?> getLocation(
      {required String text, required BuildContext context}) async {
    try {
      List<Location> locations = await locationFromAddress(text);

      if (locations.isEmpty) {
        showSnackBar(context, "Error!: Ingresa una ubicación");
        return null;
      } else {
        return locations.first;
      }
    } on NoResultFoundException {
      showSnackBar(context,
          'Error: Ingresas un ubicación valida (Ubicacion no encontrada)');
    }
    return null;
  }

  static Future<Position?> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      showSnackBar(context, 'Permisos de ubicación desabilitado');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        showSnackBar(context, 'Permiso denegado');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showSnackBar(context, 'Permisos denegados permanentemente ');
    }
    if (permission != LocationPermission.denied) {
      Position position = await Geolocator.getCurrentPosition();
      return position;
    } else {
      showSnackBar(context, 'Error: Habilita los permisos de ubicacion');
    }
    return null;
  }
}
