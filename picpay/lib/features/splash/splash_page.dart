import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picpay/config/PicpayStyles.dart';
import 'package:picpay/features/base/BaseView.dart';
import 'package:picpay/features/enter/enter_page.dart';
import 'package:picpay/features/splash/splash_contract.dart';
import 'package:picpay/features/splash/splash_presenter.dart';

class SplashPage extends BaseView<_SplashPageState> {
  @override
  _SplashPageState state() => new _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPresenter, SplashPage>
    implements SplashContract {
  @override
  void initState() {
    super.initState();
    initEnter();
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: PicpayStyles.primaryColor),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 300.0,
                height: 70.0,
                child: Image.asset('assets/images/white_logo.png'))
          ],
        ),
      ),
    );
  }

  void initEnter() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => EnterPage()));
    });
  }
}
