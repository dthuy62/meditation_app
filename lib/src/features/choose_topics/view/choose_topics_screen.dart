import 'package:flutter/material.dart';
import 'package:meditation_app/src/common/widgets/widgets.dart';

import 'package:meditation_app/src/features/choose_topics/widgets/widgets.dart';




// final topicStorage = RemoteTopicStorage();


class ChooseTopicsScreen extends StatelessWidget {
  const ChooseTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: ResponsiveBuilder(
                portrait: Column(
                  children: const [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: HeaderTopics(),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: TopicsGridView(),
                    )
                  ],
                ),
                landscape: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: const [Expanded(child: HeaderTopics()), Spacer()],
                      ),
                    ),
                    const Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: TopicsGridView(),
                    )
                  ],
                ))));
  }
}





