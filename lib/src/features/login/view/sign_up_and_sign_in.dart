import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/src/common/helpers/helpers.dart';
import 'package:meditation_app/src/common/widgets/widgets.dart';
import 'package:meditation_app/src/navigation/navigation.dart';

class SignUpAndSignIn extends StatelessWidget {
  const SignUpAndSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(fit: FlexFit.tight, child: LogoAndIllustration()),
            Flexible(fit: FlexFit.tight, child: NewWidget())
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('We are what we do'),
        // Text('Thousand of people usign silent moon\n for smalls meditation'),
        // SizedBox(
        //   height: 24,
        // ),
        // AppButton(
        //   textData: 'SIGN UP',
        //   routeName: Routes.login,
        // )
        Container(
          color: Colors.grey,
          height: 100,
        )
      ],
    );
  }
}

class LogoAndIllustration extends StatelessWidget {
  const LogoAndIllustration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AssetHelper.bgSignInAndSignUp,

                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: SvgPicture.asset(
                      AssetHelper.icLogoBlack,
                    )),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SvgPicture.asset(
                    AssetHelper.ilSignInAndSignUp,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
