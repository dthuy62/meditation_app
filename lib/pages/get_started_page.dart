import 'package:flutter/material.dart';
import 'package:meditation_app/core/constants/color_constants.dart';
import 'package:meditation_app/utils/styles.dart';
import 'package:meditation_app/widgets/getStartedBackground_widget.dart';
import 'package:meditation_app/widgets/getStartedButton_widget.dart';
import 'package:meditation_app/widgets/getStartedHeader_widget.dart';
import 'package:meditation_app/widgets/responsive_builder.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SafeArea(
            child: ResponsiveBuilder(
                potrait: Stack(
                  children: [
                    const GetStartedBackground(),
                    const FractionallySizedBox(
                        heightFactor: 0.35, child: GetStartedHeader()),
                    Align(
                      alignment: const Alignment(0.0, 0.8),
                      child: GetStartedButton(
                        fixedSize: MaterialStateProperty.all(
                            Size(size.width * 0.85, size.height * 0.065)),
                        textStyle: MaterialStateProperty.all(
                            PrimaryFont.medium(size.height * 0.015)),
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
                          child: GetStartedButton(
                            fixedSize: MaterialStateProperty.all(
                                Size(size.width * 0.4, size.height * 0.065)),
                            textStyle: MaterialStateProperty.all(
                                PrimaryFont.medium(size.height * 0.015)),
                          ),
                        )
                      ],
                    ))
                  ],
                ))));
  }
}
