import 'dart:async';

import 'package:cleanarchitecture/presentation/base/baseviewmodel.dart';

import '../../domain/model.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardinngViewModelInputs, OnBoardingViewModeloutputs {
  // Stream Controllers;
  final StreamController _streamController = StreamController<SliderViewObject>();
  // Inputs
  @override
  void dispatch() {
    // close stream;
    _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void pageChanged(int index) {
    // TODO: implement pageChanged
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // Outpute
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);
}

// Inputs means the orders that our view model will receive from our view
abstract class OnBoardinngViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe
  void goPrevious(); //when user clicks on left arrow or swipe
  void pageChanged(int index);

  Sink get inputSliderViewObject; // this is the way to add data to the stream.. stream input
}

//  outputs which means data or results that will be send from our viewmodel to our view
abstract class OnBoardingViewModeloutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numbOfSlider;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numbOfSlider, this.currentIndex);
}
