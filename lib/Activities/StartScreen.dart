import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_wallet/Colors.dart';
import 'package:crypto_wallet/CustomComponents/GradientText.dart';
import 'package:crypto_wallet/CustomComponents/RoundedButton.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreen createState() => _StartScreen();

}

class _StartScreen extends State<StartScreen>{

  late String textUp;
  late String textDown;

  List<Widget> circlesReturn(){
    List<Widget> widgets = [];
    for (int i = 0; i<3; i++){
      widgets.add(Icon(Icons.circle, color: stage-1 == i ? ProjectColors.selectedCircle : ProjectColors.noneSelectedCircle, size: 8,));
      widgets.add(const Padding(padding: EdgeInsets.only(left: 4)));
    }
    return widgets;
  }

  AssetImage imagePreview = const AssetImage('assets/images/startScreen1.png');
  EdgeInsets marginsImage = const EdgeInsets.only(top: 145);
  EdgeInsets marginsText = const EdgeInsets.only(top: 63);
  EdgeInsets marginsDots = const EdgeInsets.only(top: 77);
  bool visible = true;
  bool visibleText = true;

  Gradient  textGradientUp = ProjectColors.whiteGradient;
  Gradient  textGradientDown = ProjectColors.startScreenGradient;

  TextStyle textStyleUp = const TextStyle(
      color: Colors.white,
      fontFamily: 'Archivo',
      fontSize: 40
  );
  TextStyle textStyleDown = const TextStyle(
      fontFamily: 'Archivo',
      fontSize: 40,
      fontWeight: FontWeight.bold
  );
  int stage = 1;
  String buttonText = "Next";

  @override
  void initState() {
    super.initState();
    textUp = "Property";
    textDown = "Diversity";
  }

  void changeStage(){
    setState(() {
      switch(stage){
        case 1:
          setState(() {
            visible = false;
            visibleText = false;
          });

          marginsImage = const EdgeInsets.only(top: 145);
          marginsDots = const EdgeInsets.only(top: 160);
          marginsText = const EdgeInsets.only(top: 58);

          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              visibleText = true;
              marginsDots = const EdgeInsets.only(top: 72);
              textUp = "Safe";
              textDown = "Security";
              imagePreview = const AssetImage('assets/images/startScreen2.png');
              visible = true;
            });
          });
          break;
        case 2:
          setState(() {
            visible = false;
            visibleText = false;
          });
          marginsImage = const EdgeInsets.only(top: 158);
          marginsText = const EdgeInsets.only(top: 45);
          marginsDots = const EdgeInsets.only(top: 160);

          TextStyle temp = textStyleDown;
          textStyleDown = textStyleUp;
          textStyleUp = temp;

          textGradientDown = ProjectColors.whiteGradient;
          textGradientUp = ProjectColors.startScreenGradient;

          buttonText = "Get start";
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              visibleText = true;
              marginsDots = const EdgeInsets.only(top: 72);
              textUp = "Convenient";
              textDown = "Transaction";
              imagePreview = const AssetImage('assets/images/startScreen3.png');
              visible = true;
            });
          });
          break;
        case 3:
          Navigator.pushReplacementNamed(context, "/WalletSetupWelcome");
          break;
      }
    });
    stage++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.backgroundMain,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: marginsImage),
                AnimatedOpacity(
                    opacity: visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Image(image: imagePreview, width: 295, height: 295,),
                ),
                Padding(padding: marginsText),
                Visibility(visible: visibleText,
                  child: GradientTextWithChild(AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [TypewriterAnimatedText(textUp, speed: const Duration(milliseconds: 100),)]),
                  gradient: textGradientUp,
                  style: textStyleUp,
                  key: UniqueKey(),
                ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                Visibility(visible: visibleText,
                child: GradientTextWithChild(AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(textDown, speed: const Duration(milliseconds: 100))
                    ]),
                  gradient: textGradientDown,
                  style: textStyleDown,
                  key: UniqueKey(),
                ),
                ),
                Padding(padding: marginsDots),
                Row(children: circlesReturn()),
                const Padding(padding: EdgeInsets.only(top:16)),
                RoundedButton(changeStage, Text(buttonText, style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.bold),
                ),
                  radius: const BorderRadius.all(Radius.circular(80)),
                  color: ProjectColors.gray21,
                  height: 48,
                  width: MediaQuery.of(context).size.width-48,
                ),

              ],
            )
          ],
        ),
      )
    );
    }

}