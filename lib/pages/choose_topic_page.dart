import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/data/model/my_error.model.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/pages/reminders_page.dart';
import 'package:meditation_app/utils/styles.dart';
import 'package:meditation_app/widgets/responsive_builder.dart';

part '../widgets/_headerTopic.dart';
part '../widgets/_topicGrid_widget.dart';

// final topicStorage = RemoteTopicStorage();
  final topicStorage = AssetTopicStorage();

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: ResponsiveBuilder(
                potrait: Column(
                  children: const [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: _Header(),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: _TopicGrid(),
                    )
                  ],
                ),
                landscape: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        children: const [Expanded(child: _Header()), Spacer()],
                      ),
                    ),
                    const Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: _TopicGrid(),
                    )
                  ],
                ))));
  }
}





