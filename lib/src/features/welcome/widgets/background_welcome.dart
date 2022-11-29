import 'package:flutter/material.dart';
import 'package:meditation_app/src/common/extensions/context_extension.dart';
import 'package:meditation_app/src/common/helpers/helpers.dart';




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