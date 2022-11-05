import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 150),
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 100,
      ),
    );
  }
}

class FondoAvatar extends StatelessWidget {
  const FondoAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 150, right: 6),
      child: Container(
        width: 225,
        height: 225,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/log.png'))),
      ),
    );
  }
}
