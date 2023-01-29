import 'package:flutter/material.dart';

class ShadowConstant {
  static int shadowAlpha = 50;
  static int weakShadowAlpha = 10;
  static double blurRadius = 4;

  static BoxShadow boxShadow = BoxShadow(
      color: Colors.black.withAlpha(shadowAlpha),
      blurRadius: blurRadius,
      spreadRadius: 0,
      offset: const Offset(0, 4));

  static BoxShadow weakBoxShadow = BoxShadow(
      color: Colors.black.withAlpha(weakShadowAlpha),
      blurRadius: blurRadius,
      offset: const Offset(0, 4));
}
