import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/widget/social_buttons.dart';

class FacebookSignIn extends StatelessWidget {
  const FacebookSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialBoton(
          onPressed: () {},
          color: Colors.white,
          image: const Image(image: AssetImage("assets/images/facebook.png")),
        ),
        const SizedBox(width: 28),
      ],
    );
  }
}
