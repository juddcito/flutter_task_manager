

import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color.fromARGB(255, 139, 198, 250),
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
  );

}