// Ignore: filenNames
// ignore_for_file: file_names

import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, SnackBar, Text;

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
