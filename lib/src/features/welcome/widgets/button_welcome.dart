import 'package:flutter/material.dart';
import 'package:meditation_app/src/common/theme/theme.dart';
import 'package:meditation_app/src/navigation/navigation.dart';



class ButtonWelcome extends StatelessWidget {
  const ButtonWelcome({Key? key, this.fixedSize, this.textStyle})
      : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.login);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorPalette.lightGreyColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(38))),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixedSize,
        foregroundColor: MaterialStateProperty.all(ColorPalette.darkGreyColor),
        textStyle: textStyle,
      ),
      child: const Text('GET STARTED'),
    );
  }
}
