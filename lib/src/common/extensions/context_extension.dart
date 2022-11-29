import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  Orientation get orientation => MediaQuery.of(this).orientation;
  Size get screenSize => MediaQuery.of(this).size;
}
