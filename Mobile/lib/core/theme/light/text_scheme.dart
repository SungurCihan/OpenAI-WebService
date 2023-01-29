import 'package:flutter/material.dart';

import '../../constants/application_constants.dart';
import 'color_scheme.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    _instance ??= TextThemeLight._init();
    return _instance!;
  }

  TextThemeLight._init();

  final TextStyle headline1 =
      const TextStyle(fontSize: 96, fontWeight: FontWeight.w300);

  final TextStyle headLine3 = const TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Open Sans');

  final TextStyle bodyText1 = TextStyle(
      fontSize: ApplicationConstants.fontSizeHigh,
      color: ColorSchemeLight.instance.white);

  final TextStyle blueSmallFont = TextStyle(
      fontSize: ApplicationConstants.fontSizeLow,
      color: ColorSchemeLight.instance.brandeisBlue);
}
