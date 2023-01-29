import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance!;
  }

  ColorSchemeLight._init();

  final Color clipPink = const Color(0xffFF007F);
  final Color weatheredStone = const Color(0xffC4C4C4);
  final Color brandeisBlue = const Color(0xff006FFF);
  final Color cyrastalFalls = const Color(0xffE1E3F2);
  final Color pearlGrey = const Color(0xffF8F8F8);
  final Color white = const Color(0xffffffff);
  final Color bananaCream = const Color(0xffFFF899);
  final Color red = const Color(0xffFFF899);
  final Color sailorMoon = const Color(0xffFFEE00);
  final Color black = Colors.black;
  final Color grey = Colors.grey;
  final Color battleToad = const Color(0xff18CB4E);
  final Color amberAccent = Colors.blue;

  final Brightness lightBright = Brightness.light;
  final Brightness lightDark = Brightness.dark;
}
