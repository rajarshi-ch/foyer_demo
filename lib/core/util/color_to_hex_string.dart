import 'package:flutter/material.dart';

String materialColorToHex(Color color) {
  return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
}

MaterialColor hexToMaterialColor(String hexString) {
  int value = int.parse(hexString.substring(1, 7), radix: 16);
  return MaterialColor(value, {
    50: Color(value).withOpacity(0.1),
    100: Color(value).withOpacity(0.2),
    200: Color(value).withOpacity(0.3),
    300: Color(value).withOpacity(0.4),
    400: Color(value).withOpacity(0.5),
    500: Color(value).withOpacity(0.6),
    600: Color(value).withOpacity(0.7),
    700: Color(value).withOpacity(0.8),
    800: Color(value).withOpacity(0.9),
    900: Color(value).withOpacity(1.0),
  });
}
