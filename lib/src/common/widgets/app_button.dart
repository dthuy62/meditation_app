import 'package:flutter/material.dart';
import 'package:meditation_app/src/common/theme/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.fixedSize,
    this.textStyle,
    this.routeName = '',
    required this.textData,
  }) : super(key: key);
  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;
  final String routeName;
  final String textData;

  @override
  Widget build(BuildContext context) {
    void onPressedScreen() {
      Navigator.of(context).pushNamed(routeName);
    }

    return ElevatedButton(
      onPressed: () => onPressedScreen(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorPalette.lightGreyColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(38))),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixedSize,
        foregroundColor: MaterialStateProperty.all(ColorPalette.darkGreyColor),
        textStyle: textStyle,
      ),
      child: Text(textData),
    );
  }
}
