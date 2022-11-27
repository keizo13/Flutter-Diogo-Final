import 'package:flutter/material.dart';

import '../themes/colors_theme.dart';

class ThemeConfig {
  ThemeConfig(this.context);
  final BuildContext context;

  ThemeData get lightTheme => ThemeData();

  ThemeData get darkTheme => ThemeData();
}

extension CustomColors on ColorScheme {
  Color get primaryText =>
      brightness == Brightness.light ? ColorsTheme.primary : Colors.grey;
}
