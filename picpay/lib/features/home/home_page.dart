import 'package:flutter/material.dart';
import 'package:picpay/features/base/BaseView.dart';
import 'package:picpay/features/home/home_contract.dart';
import 'package:picpay/features/home/home_presenter.dart';

class HomePage extends BaseView<_HomePageState> {
  @override
  _HomePageState state() => new _HomePageState();
}

class _HomePageState extends BaseState<HomePresenter, HomePage>
    implements HomeContract {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(body: Text("Home"));
  }
}
