import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/screen/screens.dart';
import 'package:prueba_tecnica/ui/widget/background.dart';
import 'package:prueba_tecnica/ui/widget/button.dart';
import 'package:prueba_tecnica/ui/widget/circle_Avatar.dart';
import 'package:prueba_tecnica/ui/widget/text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Background(),
        SizedBox(
          width: 1000,
          child: Column(
            children: [
              Stack(
                  alignment: AlignmentDirectional.center,
                  children: const [Avatar(), FondoAvatar()]),
              const TextScreen(),
              ButtonsStyle(
                backgroundColor: Color(0xff0FB8C2),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                sizeH: 60,
                sizeW: 310,
                text: 'START',
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
