part of '../pages/choose_topic_page.dart';



class _TopicGrid extends StatelessWidget {
  const _TopicGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: topicStorage.load(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          print(snapshot.hasError);
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
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('$RemindersPage');
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: topic.bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return SvgPicture.asset(
                              topic.thumbnail,
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                        ),
                        Text(
                          topics[index].title,
                          style: PrimaryFont.bold(
                              context.screenSize.shortestSide * 0.04
                          )
                              .copyWith(color: topic.textColor),
                        ),
                        const SizedBox(
                          height: 18,
                        )
                      ]),
                ),
              ),
            );
          },
        );
      },
    );
  }
}