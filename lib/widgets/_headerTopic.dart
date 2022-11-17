part of '../pages/choose_topic_page.dart';
// import 'package:flutter/material.dart';
// import 'package:meditation_app/utils/styles.dart';



class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Spacer(
          flex: 3,
        ),
        Flexible(
            flex: 3,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'What Brings you',
                        style: PrimaryFont.bold(24),
                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child:
                      Text('to Silent Moon?', style: PrimaryFont.light(28)),
                    ),
                  )
                ])),
        const SizedBox(
          height: 8,
        ),
        const Flexible(flex: 1, child: Text('choose a topic to focus on:')),
        const Spacer(
          flex: 2,
        )
      ]),
    );
  }
}