import 'package:flutter/material.dart';
import 'package:picpay/AppInjector.dart';
import 'package:picpay/config/picPayTheme.dart';
import 'package:picpay/config/routes.dart';

void main() {
  AppInjector.inject();
  runApp(PicPayApp());
}

class PicPayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Picpay',
        theme: picPayTheme(),
        routes: routes);
  }
}
