import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation/utils/theme.dart';

class Begin extends StatelessWidget {
  const Begin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: orientation == Orientation.portrait
          ? Stack(children: [
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.6,
                widthFactor: 1,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SvgPicture.asset('assets/images/background_begin.svg'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
                width: size.width,
                child: SvgPicture.asset(
                  'assets/images/logo_white.svg',
                ),
              ),
              ContentSession(size: size),
            ])
          : Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          heightFactor: 1,
                          widthFactor: 1,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: SvgPicture.asset(
                                'assets/images/background_begin.svg'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 50),
                          width: size.width,
                          child: SvgPicture.asset(
                            'assets/images/logo_white.svg',
                          ),
                        ),
                      ],
                    )),
                Expanded(child: ContentSession(size: size))
              ],
            ),
    );
  }
}

class ContentSession extends StatelessWidget {
  const ContentSession({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    bool isPortrait = orientation == Orientation.portrait;
    return Align(
      alignment: isPortrait ? Alignment.bottomCenter : Alignment.center,
      child: FractionallySizedBox(
        heightFactor: isPortrait ? 0.4 : 0.9,
        child: Column(children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'We are what we do\n',
                  style: PrimaryFont.medium(30).copyWith(
                    color: kColorDarkGrey,
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Thousand of people are usign silent moon for smalls meditation',
                      style: PrimaryFont.thin(20).copyWith(
                        color: kColorDarkGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: GetStartedButton2(
                      fixedSize: MaterialStateProperty.all(
                        Size(
                          isPortrait ? size.width * 0.9 : size.width * 0.3,
                          size.height * 0.065,
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        PrimaryFont.medium(size.height * 0.01),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'ALREADY HAVE AN ACCOUNT? ',
                      style: PrimaryFont.medium(15).copyWith(
                        color: kColorDarkGrey,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'LOG IN',
                          style: PrimaryFont.medium(15).copyWith(
                            color: kColorPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}

class GetStartedButton2 extends StatelessWidget {
  const GetStartedButton2({
    Key? key,
    this.fixedSize,
    this.textStyle,
  }) : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //Navigator.of(context).pushNamed('$ChooseTopicPage');
      },
      child: const Text('SIGN UP'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kColorPrimary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixedSize,
        foregroundColor: MaterialStateProperty.all(kColorWhite),
        textStyle: textStyle,
      ),
    );
  }
}
