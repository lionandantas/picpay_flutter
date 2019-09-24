import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:picpay/features/home/home_presenter.dart';
import 'package:picpay/features/login/login_presenter.dart';
import 'package:picpay/features/root/root_presenter.dart';
import 'package:picpay/features/splash/splash_presenter.dart';

class AppInjector {
  static const String HOST_URL_KEY = "host_url";

  static inject() {
    final injector = Injector.getInjector();

    injector.map<SplashPresenter>((i) => SplashPresenter());
    injector.map<LoginPresenter>((i) => LoginPresenter());
    injector.map<RootPresenter>((i) => RootPresenter());
    injector.map<HomePresenter>((i) => HomePresenter());
  }
}
