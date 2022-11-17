
import 'package:flutter/material.dart';
import 'package:meditation_app/core/constants/color_constants.dart';
import 'package:meditation_app/core/helpers/asset_helper.dart';
import 'package:meditation_app/core/helpers/image_helper.dart';
import 'package:meditation_app/utils/styles.dart';

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
                    style: PrimaryFont.medium(30).copyWith(
                        color: ColorPalette.lightYellowColor, height: 1.3),
                    children: [
                      TextSpan(
                          text: 'to Silent Moon',
                          style: PrimaryFont.thin(30)
                              .copyWith(color: ColorPalette.lightYellowColor)),
                    ])
                    ),
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
                    style: PrimaryFont.light(20)
                        .copyWith(color: ColorPalette.lightGreyColor),
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
