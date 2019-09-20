import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picpay/config/picpayStyles.dart';
import 'package:picpay/features/enter/enter_contract.dart';
import 'package:picpay/features/enter/enter_presenter.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:picpay/models/Quality.dart';
import 'package:picpay/widgets/PicPayButton.dart';
import 'package:picpay/widgets/PicPayButtonHelp.dart';

class EnterPage extends StatefulWidget {
  @override
  _EnterPageState createState() => new _EnterPageState();
}

class _EnterPageState extends State<EnterPage>
    with AutomaticKeepAliveClientMixin<EnterPage>
    implements EnterContract {
  EnterPresenter _presenter;

  int currentPage = 0;
  int currentColor = 0;
  bool reverse = false;
  PageController _controller = new PageController();
  Timer _pageChangeTimer;
  Timer colorTimer;

  List<Quality> hookUpPlusList = [
    new Quality(subTitle: "Envie e receba dinheiro pelo smartphone"),
    new Quality(subTitle: "Faca recargas de celular"),
    new Quality(subTitle: "Compre créditos do Uber, Steam e Leve Up"),
  ];
  void _pageChanger() {
    _pageChangeTimer = Timer.periodic(Duration(seconds: 2), (_) {
      if (reverse == false && currentPage < hookUpPlusList.length - 1) {
        _controller.nextPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeIn);
      } else if (reverse == true && currentPage <= hookUpPlusList.length - 1) {
        _controller.previousPage(
            duration: Duration(milliseconds: 5), curve: Curves.easeOut);
      }
    });
  }

  void _onPageChanged(int value) {
    //print("$value $reverse");
    setState(() {
      currentPage = value;
    });

    if (currentPage == hookUpPlusList.length - 1) {
      setState(() {
        reverse = true;
      });
      return;
    }

    if (currentPage == 0) {
      setState(() {
        reverse = false;
      });
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageChangeTimer.cancel();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _presenter = new EnterPresenter(this);

    _pageChanger();
  }

  @override
  Widget build(BuildContext context) {
    var form = Container(
      decoration: BoxDecoration(color: PicpayStyles.primaryColor),
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
                child: Image.asset(
                  'assets/images/white_logo.png',
                  height: 70,
                ),
              ),
              _buildHookUpPlusUI(),
              Padding(
                  padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: PicPayButton(
                      text: "Criar minha conta no PicPay!",
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      colorBackground: PicpayStyles.white,
                      colorText: PicpayStyles.black,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                child: new GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Já sou cadastrado",
                      style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Robo',
                        fontSize: 17.0,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.0, left: 1.0, right: 1.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: PicPayButtonHelp(onPressed: () {}),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      body: form,
    );
  }

  Widget _buildHookUpPlusUI() {
    return Container(
      height: 120.0,
      child: PageIndicatorContainer(
          size: 8.0,
          indicatorSpace: 5.0,
          indicatorSelectorColor: PicpayStyles.white,
          indicatorColor: Colors.grey.withOpacity(0.5),
          align: IndicatorAlign.bottom,
          pageView: new PageView.builder(
              controller: _controller,
              onPageChanged: _onPageChanged,
              itemCount: hookUpPlusList.length,
              itemBuilder: (c, index) {
                return new Container(
                  padding: EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(top: 10.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hookUpPlusList[index].subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: PicpayStyles.picPayText,
                            fontFamily: 'Robo'),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                );
              }),
          length: hookUpPlusList.length),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
