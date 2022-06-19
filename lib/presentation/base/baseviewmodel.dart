abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs {
  // Shared variables and functions that will be used through any view model
}

abstract class BaseViewModelInputs {
  void start(); //will be called while initialation of view model
  void dispatch(); // will be called when viewmodel dies.
}

abstract class BaseViewModelOutputs {}
