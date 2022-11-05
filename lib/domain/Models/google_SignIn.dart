import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/utils.dart';
import 'package:prueba_tecnica/data/services/firebase_services.dart';
import 'package:prueba_tecnica/ui/widget/loading.dart';
import 'package:prueba_tecnica/ui/widget/social_buttons.dart';

class GoogleSinIn1 extends StatelessWidget {
  const GoogleSinIn1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialBoton(
          onPressed: () async {
            await FirebaseServices.signInWithGoogle(context);
            Loading.loadingCircle(context: context);
            Navigator.of(context).pop();
          },
          color: Colors.white,
          image: Image(image: AssetImage("assets/images/google.png")),
        ),
        const SizedBox(width: 28),
      ],
    );
  }
}
