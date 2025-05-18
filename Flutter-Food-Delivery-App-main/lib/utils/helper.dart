import 'package:flutter/material.dart';

class Helper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName(String fileName, String type) {
    return "assets/images/$type/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static TextStyle? displayLarge(BuildContext context) {
    return getTheme(context).displayLarge;
  }

  static TextStyle? displayMedium(BuildContext context) {
    return getTheme(context).displayMedium;
  }

  static TextStyle? displaySmall(BuildContext context) {
    return getTheme(context).displaySmall;
  }

  static TextStyle? headlineLarge(BuildContext context) {
    return getTheme(context).headlineLarge;
  }

  static TextStyle? headlineMedium(BuildContext context) {
    return getTheme(context).headlineMedium;
  }

  static TextStyle? headlineSmall(BuildContext context) {
    return getTheme(context).headlineSmall;
  }

  static TextStyle? titleLarge(BuildContext context) {
    return getTheme(context).titleLarge;
  }

  static TextStyle? titleMedium(BuildContext context) {
    return getTheme(context).titleMedium;
  }

  static TextStyle? titleSmall(BuildContext context) {
    return getTheme(context).titleSmall;
  }

  static TextStyle? bodyLarge(BuildContext context) {
    return getTheme(context).bodyLarge;
  }

  static TextStyle? bodyMedium(BuildContext context) {
    return getTheme(context).bodyMedium;
  }

  static TextStyle? bodySmall(BuildContext context) {
    return getTheme(context).bodySmall;
  }
}
