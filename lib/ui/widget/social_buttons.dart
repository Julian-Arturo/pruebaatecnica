import 'package:flutter/material.dart';
import 'package:prueba_tecnica/core/utils/ui_utils.dart';

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
    UiUtils _utils = UiUtils();
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60))),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size(50, 50))),
      child: SizedBox(
        width: _utils.screenSize.width * 0.1,
        height: 40,
        child: image,
      ),
    );
  }
}
