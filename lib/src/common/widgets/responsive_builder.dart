import 'package:flutter/material.dart';
import 'package:meditation_app/src/common/extensions/context_extension.dart';




class ResponsiveBuilder extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

  const ResponsiveBuilder(
      {Key? key, required this.portrait, required this.landscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait ? portrait : landscape;
  }
}
