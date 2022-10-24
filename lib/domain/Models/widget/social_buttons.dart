import 'package:flutter/material.dart';

class SocialBoton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Image image;
  final Color color;
  const SocialBoton({
    Key? key,
    this.onPressed,
    required this.color,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.5))),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size(45, 45))),
      child: SizedBox(
        width: 40,
        height: 40,
        child: image,
      ),
    );
  }
}
