import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Text('Encuentra tu ubicación y la de tu familia facilmente',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}

class TextScrrenLogin extends StatelessWidget {
  const TextScrrenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: const Text(
        'Bienvenido a Search Earth',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'KulimPark-Bold',
            fontSize: 20,
            color: Colors.black,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TextScrenRegister extends StatelessWidget {
  const TextScrenRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 5),
      child: const Text(
        'Registarte',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'KulimPark-Bold',
            fontSize: 30,
            color: Colors.black,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
