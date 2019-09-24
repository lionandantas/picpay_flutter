import 'package:flutter/material.dart';
import 'package:picpay/features/enter/enter_page.dart';
import 'package:picpay/features/login/login_page.dart';
import 'package:picpay/features/root/root_page.dart';
import 'package:picpay/features/splash/splash_page.dart';

final routes = {
  '/enter': (BuildContext context) => new EnterPage(),
  '/login': (BuildContext context) => new LoginPage(),
  '/root': (BuildContext context) => new RootPage(),
  '/': (BuildContext context) => new SplashPage(),
};
