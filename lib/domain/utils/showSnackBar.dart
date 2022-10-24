import 'package:flutter/material.dart';

void showSnackBar1(BuildContext context, snackMessage, color) {
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      action: SnackBarAction(
        label: "OK",
        textColor: Colors.white,
        onPressed: () {},
      ),
      content: Text(
        snackMessage,
        style: const TextStyle(fontSize: 14),
      )));
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

