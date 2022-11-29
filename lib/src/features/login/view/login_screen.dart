import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/src/common/helpers/asset_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: SafeArea(

      child: Container(child: SvgPicture.asset(
          AssetHelper.bgLogin,
      color: Colors.grey,)),
    ));
  }
}
