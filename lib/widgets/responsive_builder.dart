import 'package:flutter/material.dart';
import 'package:meditation_app/utils/styles.dart';


class ResponsiveBuilder extends StatelessWidget {
  final Widget potrait;
  final Widget landscape;

  const ResponsiveBuilder(
      {Key? key, required this.potrait, required this.landscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait ? potrait : landscape;
  }
}
