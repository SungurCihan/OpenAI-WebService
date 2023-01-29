import 'package:flutter/material.dart';

import 'abstract/i_app_theme.dart';
import 'light/abstract/i_light_theme.dart';

class AppThemeLight extends IAppTheme with ILightThheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      colorScheme: _colorScheme(),
      textTheme: _textTheme(),
      fontFamily: 'Open Sans');

  TextTheme _textTheme() => const TextTheme().copyWith(
        headline1: textThemeLight.headline1,
        headline3: textThemeLight.headLine3,
        bodyText1: textThemeLight.bodyText1,
      );

  ColorScheme _colorScheme() {
    return ColorScheme(
      primary: colorSchemeLight.clipPink,
      secondary: colorSchemeLight.weatheredStone,
      surface: colorSchemeLight.brandeisBlue,
      background: colorSchemeLight.white,
      tertiary: colorSchemeLight.sailorMoon,
      onTertiary: colorSchemeLight.bananaCream,
      error: colorSchemeLight.red,
      onPrimary: colorSchemeLight.cyrastalFalls,
      onSecondary: colorSchemeLight.black,
      onSurface: colorSchemeLight.grey,
      onBackground: colorSchemeLight.pearlGrey,
      onError: colorSchemeLight.red,
      brightness: colorSchemeLight.lightBright,
    );
  }
}
