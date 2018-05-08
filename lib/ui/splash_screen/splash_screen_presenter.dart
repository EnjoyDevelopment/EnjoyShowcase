import 'dart:async';


import '../base/base_contract.dart';
import '../base/base_presenter.dart';


abstract class SplashScreenContract extends BaseContract {
  void onStartSplashScreen();
  void onEndSplashScreen();
}

class SplashScreenPresenter extends BasePresenter {
  SplashScreenContract _view;
  SplashScreenPresenter(this._view);

  var ms = const Duration(milliseconds: 1);
  var startSplashScreenTime = const Duration(milliseconds: 300);
  var endSplashScreenTime = const Duration(seconds: 5);

  void initTimer([int milliseconds]) {
    var duration = milliseconds == null ? startSplashScreenTime : ms * milliseconds;
    new Timer(duration, onStartSplashScreen);
    duration = milliseconds == null ? endSplashScreenTime : ms * milliseconds;
    new Timer(duration, onEndSplashScreen);
  }

  void onStartSplashScreen() {
    _view.onStartSplashScreen();
  }

  void onEndSplashScreen() {
   _view.onEndSplashScreen();
  }
}
