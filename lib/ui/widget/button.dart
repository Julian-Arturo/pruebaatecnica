// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ButtonsStyle extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final double sizeW;
  final double sizeH;
  final VoidCallback onPressed;

  const ButtonsStyle(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.text,
      required this.sizeW,
      required this.sizeH,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: sizeW,
        height: sizeH,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )),
            )));
  }
}

//Se contruye el boton para el redirecionamiento

class BtnRedirection extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const BtnRedirection({Key? key, required this.text, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: onpressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.blue, fontSize: 12),
        ));
  }
}
