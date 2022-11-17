import 'package:flutter/material.dart';
import 'package:meditation_app/core/constants/color_constants.dart';
import 'package:meditation_app/utils/styles.dart';
import 'dart:ui' as ui;

class Week {
  String weekDay;

  Week({required this.weekDay});

  @override
  String toString() {
    return weekDay;
  }
}

final dayOfWeek = [
  Week(weekDay: 'SU'),
  Week(weekDay: 'M'),
  Week(weekDay: 'T'),
  Week(weekDay: 'W'),
  Week(weekDay: 'TH'),
  Week(weekDay: 'F'),
  Week(weekDay: 'S'),
];

class RemindersPage extends StatelessWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Spacer(),
            Expanded(
                flex: 2,
                child: _Title(
                  title: 'What time would you\nlike to meditate',
                  subTitle:
                  'Any time you can choose but We recommend\nfirst thing in th morning.',
                )),
            Expanded(
              flex: 3,
              child: _TimeSelect(),
            ),
            Expanded(
                flex: 2,
                child: _Title(
                  title: 'Which day would you\nlike to meditate?',
                  subTitle:
                  'Everyday is best, but we recommend picking\nat least five.',
                )),
            Expanded(
              child: _DaySelect(),
            ),
            Expanded(flex: 2, child: _Button())
          ],
        ),
      ),
    );
  }
}

class _TimeSelect extends StatelessWidget {
  const _TimeSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return ui.Gradient.linear(
                const Offset(0, 0),
                Offset(0, bounds.height),
                [
                  const Color(0x26F5F5F9),
                  const Color.fromARGB(111, 245, 245, 249),
                  const Color(0xFFF5F5F9),
                  const Color(0xFFF5F5F9),
                  const Color.fromARGB(111, 245, 245, 249),
                  const Color(0x26F5F5F9),
                ],
                [0, 0.2, 0.3, 0.7, 0.8, 1],
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Expanded(
                    child: _TimeWheel(
                      itemIndex: (index) {

                        return '${index % 12 + 1}';
                      },
                    )),
                Expanded(
                  child: _TimeWheel(
                    itemIndex: (index) {

                      return '${index % 60}';
                    },
                  ),
                ),
                Expanded(child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListWheelScrollView(
                        itemExtent: constraints.maxHeight * 0.17,
                        squeeze: 0.8,
                        diameterRatio: 1.4,
                        overAndUnderCenterOpacity: 0.5,
                        children:[
                          FittedBox(child: Text(
                            'AM', style: PrimaryFont.medium(24),),
                          ),
                          FittedBox(child: Text(
                            'PM', style: PrimaryFont.medium(24),),
                          )
                        ]
                    );
                  },
                )),
                const Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TimeWheel extends StatelessWidget {
  const _TimeWheel({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  final String Function(int index) itemIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ListWheelScrollView.useDelegate(
        itemExtent: constraints.maxHeight * 0.2,
        squeeze: 0.8,
        diameterRatio: 1.4,
        overAndUnderCenterOpacity: 0.5,
        onSelectedItemChanged: (index) => print('Changed ${index % 12 + 1}'),
        childDelegate: ListWheelChildBuilderDelegate(builder: (context, index) {
          return FittedBox(
            child: Text(
              itemIndex(index),
              style: PrimaryFont.medium(24),
            ),
          );
        }),
      );
    });
  }
}

class _DaySelect extends StatefulWidget {
  const _DaySelect({
    Key? key,
  }) : super(key: key);

  @override
  State<_DaySelect> createState() => _DaySelectState();
}

class _DaySelectState extends State<_DaySelect> {
  final List<int> _selectedDays = [];

  void toggleDay(int index) {
    (_selectedDays.contains(index))
        ? setState(() => _selectedDays.remove(index))
        : setState(() => _selectedDays.add(index));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(7, (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => toggleDay(index),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedDays.contains(index)
                            ? ColorPalette.darkGreyColor
                            : Colors.transparent,
                        border: Border.all(color: ColorPalette.lightGreyColor)),
                    child: Center(child: Text(dayOfWeek[index].toString()))),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              color: ColorPalette.primaryColor,
              elevation: 0,
              textColor: ColorPalette.lightGreyColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38)),
              child: const Text('SAVE'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: const Text('NO THANKS'),
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: FractionallySizedBox(
                alignment: Alignment.topLeft,
                heightFactor: 0.75,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: PrimaryFont.bold(24).copyWith(height: 1.35),
                  ),
                ),
              )),
          Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.6,
                alignment: Alignment.topLeft,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    subTitle,
                    style: PrimaryFont.light(16)
                        .copyWith(color: const Color(0xFFA1A4B2), height: 1.65),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
