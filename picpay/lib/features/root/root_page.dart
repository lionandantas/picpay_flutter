import 'package:flutter/material.dart';
import 'package:picpay/config/picpayStyles.dart';
import 'package:picpay/features/base/BaseView.dart';
import 'package:picpay/features/home/home_page.dart';
import 'package:picpay/features/root/root_contract.dart';
import 'package:picpay/features/root/root_presenter.dart';
import 'package:picpay/widgets/PicPayBottomAppBarItem.dart';
import 'package:picpay/widgets/PicPayFloatingButton.dart';
import 'package:picpay/config/pic_pay_icons.dart';

class RootPage extends BaseView<_RootPageState> {
  @override
  _RootPageState state() => new _RootPageState();
}

class _RootPageState extends BaseState<RootPresenter, RootPage>
    implements RootContract {
  int _index = 0;
  final options = [
    HomePage(),
    Text("B"),
    Text("C"),
    Text("D"),
    Text("E"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget create(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Scaffold(
        // backgroundColor: Color(0XFF1D4384),
        //appBar: optionsAppBar.elementAt(_index),
        floatingActionButton: PicPayFloatingButton(
          onPressed: () {},
          text: "Pagar",
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: PicPayBottomAppBar(
          centerItemText: '',
          color: Colors.grey,
          selectedColor: PicpayStyles.picPayPressButton,
          onTabSelected: _selectedTab,
          items: [
            PicPayBottomAppBarItem(
                iconData: PicPay.house_black_silhouette_without_door, text: 'Inicio', notification: false),
            PicPayBottomAppBarItem(
              iconData: PicPay.credit_card,
              text: 'Carteira',
              notification: false,
            ),
            PicPayBottomAppBarItem(
              iconData: PicPay.notification,
              text: 'Notificaoes',
              counter: 2,
              notification: true,
            ),
            PicPayBottomAppBarItem(
              iconData: PicPay.settings,
              text: 'Ajustes',
              notification: false,
            ),
          ],
        ),
        body: options.elementAt(_index),
      ),
    );
  }

  void _selectedTab(int index) {
    setState(() {
      _index = index;
    });
  }
}
