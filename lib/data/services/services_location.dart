import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prueba_tecnica/core/utils/showSnackBar.dart';

class ServicesLocation {
  static Future<Location?> getLocation(
      {required String text, required BuildContext context}) async {
    List<Location> locations = await locationFromAddress(text);

    if (locations.isEmpty) {
      // ignore: use_build_context_synchronously
      showSnackBar(
          context, "No se encontraron las coodernadas de la ubicación");
      return null;
    } else {
      return locations.first;
    }
  }
}
