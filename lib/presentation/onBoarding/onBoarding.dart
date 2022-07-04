import 'package:cleanarchitecture/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart' show Align, Alignment, AppBar, Brightness, BuildContext, Column, Container, EdgeInsets, GestureDetector, Key, MainAxisAlignment, Padding, PageController, PageView, Row, Scaffold, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextAlign, TextButton, Theme, Widget;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart' show Align, Alignment, Brightness, BuildContext, Column, Container, Curves, EdgeInsets, GestureDetector, Key, MainAxisAlignment, Padding, PageController, PageView, Row, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextAlign, Widget;
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingSubTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.onboardinglogo1),
        SliderObject(AppStrings.onBoardingSubTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.onboardinglogo2),
        SliderObject(AppStrings.onBoardingSubTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.onboardinglogo3),
        SliderObject(AppStrings.onBoardingSubTitle4, AppStrings.onBoardingSubTitle4, ImageAssets.onboardinglogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: _list.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              //  return onBoardingPage
              return OnBaordingPage(_list[index]);
            }),
        bottomSheet: Container(
            color: ColorManager.white,
            height: AppSize.s100,
            child: Column(children: [
              Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: Text(AppStrings.skip, style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.end))),
              _getBottomSheetWidget()
            ])));
  }

  Widget _getBottomSheetWidget() {
    return Container(
        color: ColorManager.primary,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // left arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIc),
                ),
                onTap: () {
                  _pageController.animateToPage(_getPreviousIndex(), duration: Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);
                }),
          ),

          // Circle Indicator
          Row(children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              )
          ]),

          // Right Arrow
          Padding(
            padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIc),
                ),
                onTap: () {
                  _pageController.animateToPage(_getNextIndex(), duration: Duration(milliseconds: DurationConstant.d300), curve: Curves.bounceInOut);
                }),
          )
        ]));
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    return _currentIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  @override
  void dispose() {
    // Viewmodel.Dispose;
    super.dispose();
  }
}

class OnBaordingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  OnBaordingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
