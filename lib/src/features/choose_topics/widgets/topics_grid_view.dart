import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/src/features/choose_topics/data/topic_storage.dart';
import 'package:meditation_app/src/features/choose_topics/model/my_error.model.dart';
import 'package:meditation_app/src/features/choose_topics/model/topic.model.dart';
import 'package:meditation_app/src/navigation/navigation.dart';


final topicStorage = AssetTopicStorage();

class TopicsGridView extends StatelessWidget {
  const TopicsGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: topicStorage.load(),
      initialData: const [],
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text((snapshot.error as MyError).errorMessage),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final topics = snapshot.data!;

        return MasonryGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          mainAxisSpacing: 16,
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topic = topics[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.reminders);
              },
              child: _TopicItemView(topic: topic, topics: topics, indexTopic: index),
            );
          },
        );
      },
    );
  }
}

class _TopicItemView extends StatelessWidget {
  const _TopicItemView({
    Key? key,
    required this.topic,
    required this.topics,
    required this.indexTopic
  }) : super(key: key);

  final Topic topic;
  final List<Topic> topics;
  final int indexTopic;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: topic.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                topic.thumbnail,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                topics[indexTopic].title,
              ),
              const SizedBox(
                height: 18,
              )
            ]),
      ),
    );
  }
}
