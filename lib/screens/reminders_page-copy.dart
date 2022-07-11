import 'package:flutter/material.dart';
import 'package:meditation/utils/theme.dart';

const daysOfWeek = ["SU", "M", "T", "W", "TH", "F", "S"];

class RemindersPage extends StatelessWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          const Expanded(
              flex: 2,
              child: _Title(
                title: 'What time would you\nlike to mediate?',
                subtitle:
                    'Any time you can choose but We recommended\nfirst thing in the morning',
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kColorLightGrey,
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
          const Expanded(
              flex: 2,
              child: _Title(
                title: 'Which day would you\nlike to mediate?',
                subtitle:
                    'Everyday is best, but we recommended picking\n at least five',
              )),
          Expanded(
            child: _DaySelect(),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: MaterialButton(
                      color: kColorPrimary,
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text('Save', style: PrimaryFont.medium(14)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                    Expanded(
                        child: TextButton(
                            child: Text(
                              'NO THANKS',
                              style: PrimaryFont.medium(14)
                                  .copyWith(color: kColorDarkGrey),
                            ),
                            onPressed: () {})),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

class _DaySelect extends StatelessWidget {
  const _DaySelect({
    Key? key,
  }) : super(key: key);

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
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: const Color(0xFFA1A4B2),
                  ),
                ),
                child: Center(
                  child: FittedBox(child: Text(daysOfWeek[index])),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              alignment: Alignment.topLeft,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: PrimaryFont.bold(24).copyWith(height: 1.35),
                ),
              ),
            ),
          ),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topLeft,
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  subtitle,
                  style: PrimaryFont.light(16).copyWith(
                    color: const Color(0xFFA1A4B2),
                    height: 1.65,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title2 extends StatelessWidget {
  const _Title2({Key? key, required this.title, required this.subtiles})
      : super(key: key);

  final String title;
  final String subtiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Text(
            title,
            style: PrimaryFont.bold(20),
          )),
          Expanded(
              child: Text(
            subtiles,
            style: PrimaryFont.light(12)
                .copyWith(color: kColorDarkGrey, height: 1.5),
          )),
        ],
      ),
    );
  }
}
