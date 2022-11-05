import 'package:flutter/material.dart';

class BackgroundF extends StatelessWidget {
  const BackgroundF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/mundo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.lighten)),
      )),
    );
  }
}
