import 'package:flutter/material.dart';
import 'package:meditation_app/src/common/extensions/context_extension.dart';
import 'package:meditation_app/src/common/helpers/helpers.dart';
import 'package:meditation_app/src/common/theme/theme.dart';


class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: ImageHelper.loadFromAsset(AssetHelper.icLogo,
                fit: BoxFit.none, alignment: const Alignment(0.0, -0.8))),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: FittedBox(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Hi Afsar, Welcome\n',
                    style: context.textTheme.headline3?.copyWith(
                        color: ColorPalette.lightYellowColor, height: 1.3),
                    children: [
                      TextSpan(
                          text: 'to Silent Moon',
                          style: context.textTheme.headline3
                              ?.copyWith(color: ColorPalette.lightYellowColor)),
                    ])),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Text(
                    'Explore the app, Find some peace of mind\n to prepare for meditation.',
                    style: context.textTheme.headline3
                        ?.copyWith(color: ColorPalette.lightGreyColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
