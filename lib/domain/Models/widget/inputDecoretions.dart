import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoretion({
    required String hintText,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xff99A5A8),
      hintText: hintText,
      hintStyle: const TextStyle(
          color: Color(0xff65656B), fontWeight: FontWeight.bold, fontSize: 12),
      contentPadding: const EdgeInsets.only(left: 25),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
    );
  }
}
