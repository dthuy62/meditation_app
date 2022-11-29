
import 'package:flutter/material.dart';

class HeaderTopics extends StatelessWidget {
  const HeaderTopics({
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

                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Expanded(
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child:
                          Text('to Silent Moon?'),
                    ),
                  )
                ])),
        const SizedBox(
          height: 8,
        ),
        const Flexible(
          flex: 1,
          child: Text(
            'choose a topic to focus on:',
          ),
        ),
        const Spacer(
          flex: 2,
        )
      ]),
    );
  }
}
