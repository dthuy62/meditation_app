import 'package:flutter/material.dart';
import 'package:meditation_app/src/common/extensions/context_extension.dart';
import 'package:meditation_app/src/common/theme/theme.dart';

import 'package:meditation_app/src/common/widgets/responsive_builder.dart';
import 'package:meditation_app/src/features/welcome/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SafeArea(
            child: ResponsiveBuilder(
                portrait: Stack(
                  children: [
                    const GetStartedBackground(),
                    const FractionallySizedBox(
                        heightFactor: 0.35, child: GetStartedHeader()),
                    Align(
                      alignment: const Alignment(0.0, 0.8),
                      child: ButtonWelcome(
                        fixedSize: MaterialStateProperty.all(
                            Size(size.width * 0.85, size.height * 0.065)),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: size.height * 0.015)
                        ),
                      ),
                    )
                  ],
                ),
                landscape: Row(
                  children: [
                    const Expanded(
                        child: Align(
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                          heightFactor: 0.8, child: GetStartedHeader()),
                    )),
                    Expanded(
                        child: Stack(
                      children: [
                        const GetStartedBackground(),
                        Align(
                          alignment: const Alignment(0.0, 0.8),
                          child: ButtonWelcome(
                            fixedSize: MaterialStateProperty.all(
                                Size(size.width * 0.4, size.height * 0.065)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: size.height * 0.015)),
                          ),
                        )
                      ],
                    ))
                  ],
                ))));
  }
}
