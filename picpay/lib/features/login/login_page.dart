import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picpay/config/picpayStyles.dart';
import 'package:picpay/features/base/BaseView.dart';
import 'package:picpay/features/login/login_contract.dart';
import 'package:picpay/features/login/login_presenter.dart';
import 'dart:ui';

import 'package:picpay/widgets/HexColor.dart';
import 'package:picpay/widgets/PicPayButton.dart';

class LoginPage extends BaseView<_LoginPageState> {
  @override
  _LoginPageState state() => new _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPresenter, LoginPage>
    implements LoginContract {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final Map<String, dynamic> _formData = {
    'email': null,
    'senha': null,
    'acceptTerms': false
  };

  @override
  void initState() {
    super.initState();
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: HexColor("#10C66F"),
    ));*/
  }

  void _submitForm() async {}

  @override
  Widget create(BuildContext context) {
    var loginForm = Container(
      width: double.infinity,
      height: double.infinity,
      key: scaffoldKey,
      decoration: BoxDecoration(color: PicpayStyles.primaryColor),
      //Color(0XFF1D4384)
      padding: EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Container(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 150.0, bottom: 5.0, left: 40.0, right: 40.0),
                      child: new TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        onSaved: (String value) {
                          _formData['email'] = value;
                        },
                        decoration: new InputDecoration(
                            labelText: 'E-mail nome de usuário ou telefone',
                            enabledBorder: new UnderlineInputBorder(
                                borderSide:
                                    new BorderSide(color: PicpayStyles.white)),
                            //  hintText: "Entre com seu E-mail",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: PicpayStyles.black),
                            ),
                            hintStyle: TextStyle(
                                fontSize: 15.0, color: PicpayStyles.white),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                color: PicpayStyles.white)),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 40.0, right: 40.0),
                    child: new TextFormField(
                      autofocus: true,
                      obscureText: true,
                      decoration: new InputDecoration(
                          labelText: 'Senha',
                          fillColor: PicpayStyles.black,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: PicpayStyles.white),
                          ),
                          //suffixIcon: Icon(Icons.email),
                          enabledBorder: new UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: PicpayStyles.white)),
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: PicpayStyles.black),
                          labelStyle: new TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                              color: PicpayStyles.white)),
                      onSaved: (String value) {
                        _formData['senha'] = value;
                      },
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: PicPayButton(
                          text: "ENTRAR",
                          onPressed: () => _submitForm(),
                          colorBackground: PicpayStyles.white,
                          colorText: PicpayStyles.black,
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/recoverpassword");
                        },
                        child: Text("Esqueceu sua senha do PicPay?",
                            style: TextStyle(
                              color: PicpayStyles.white,
                              fontFamily: 'Robo',
                              fontSize: 14.0,
                            )),
                      )),
                ],
              )),
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: new Text('Login',
              style: TextStyle(
                color: PicpayStyles.white,
                //wordSpacing: 2.0
              )),
          iconTheme: IconThemeData(
            color: PicpayStyles.white, //change your color here
          ),
          backgroundColor: PicpayStyles.primaryColor,
          elevation: 0.0,
        ),
        body: loginForm);
  }
}
