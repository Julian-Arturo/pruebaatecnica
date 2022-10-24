import 'package:flutter/material.dart';
import 'package:prueba_tecnica/domain/Models/widget/social_buttons.dart';

class GoogleSinIn1 extends StatelessWidget {
  const GoogleSinIn1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialBoton(
          onPressed: () {},
          color: Colors.white,
          image: const Image(image: AssetImage("assets/images/google.png")),
        ),
        const SizedBox(width: 28),
      ],
    );
  }
}
