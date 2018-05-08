import '../splash_screen/splash_screen_presenter.dart';
import 'base_contract.dart';
import 'base_presenter.dart';

enum ViewType { splashScreen }

class PresenterFactoryProducer {
  static BasePresenter getPresenter(ViewType viewType, BaseContract contract) {
    if (viewType == ViewType.splashScreen) {
      return new SplashScreenPresenter(contract);
    }

    else throw new Exception("Unknown presenter.Have you added it?");
  }
}
