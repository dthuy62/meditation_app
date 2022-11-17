import 'package:flutter/material.dart';
import 'package:meditation_app/core/helpers/asset_helper.dart';
import 'package:meditation_app/core/helpers/image_helper.dart';
import 'package:meditation_app/utils/styles.dart';


class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: context.orientation == Orientation.landscape ? 0.9 : 0.6,
          widthFactor: 1,
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            clipBehavior: Clip.antiAlias,
            child: ImageHelper.loadFromAsset(AssetHelper.bgGetStarted,
                fit: BoxFit.fitWidth, alignment: Alignment.topCenter),
          ),
        )
        );
  }
}