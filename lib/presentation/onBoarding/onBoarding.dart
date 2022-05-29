import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorManager.darkgrey, body: Center(child: Text("Welcome to On Boarding")));
  }
}
