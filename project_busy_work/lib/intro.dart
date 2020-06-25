import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'home_widget.dart';
import 'myColors.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Planner",
        description: "Plan your activites in advance to stay productive!",
        pathImage: "assets/images/intro_first.png",
        backgroundColor: hGreen,
      ),
    );
    slides.add(
      new Slide(
        title: "Cool Graphs!",
        description: "Know more about your time!",
        pathImage: "assets/images/intro_second.png",
        backgroundColor: bgGreen,
      ),
    );
    slides.add(
      new Slide(
        title: "Let's Get Started!",
        description:
        "Being Organized is Being in Control",
        pathImage: "assets/images/intro_third.png",
        backgroundColor: hGreen,
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (context) => new Home()));
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,

      nameDoneBtn: "START",
      isShowSkipBtn: false,
      colorDoneBtn: lGrey,
      colorSkipBtn: lGrey,
    );
  }
}