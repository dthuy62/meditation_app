import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({Key? key, this.fixedSize, this.textStyle}) : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
