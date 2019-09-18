import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:picpay/config/Strings.dart';

import 'BasePresenter.dart';
import 'BaseViewCallback.dart';

abstract class BaseView<S extends State<StatefulWidget>>
    extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => state();

  S state();
}

abstract class BaseState<P extends BasePresenter, V extends BaseView>
    extends State<V> implements BaseViewCallback {
  @protected
  P presenter;

  bool _contentVisible = true;
  bool _isLoading = false;

  BaseState() {
    presenter = Injector.getInjector().get();
    presenter.view = this;
  }

  @override
  void initState() {
    super.initState();
    presenter.init();
  }

  @override
  dispose() {
    presenter.dispose();
    super.dispose();
  }

  @override
  showProgress({bool contentVisible = false}) {
    setState(() {
      _contentVisible = contentVisible;
      _isLoading = true;
    });
  }

  @override
  hideProgress() {
    setState(() {
      _contentVisible = true;
      _isLoading = false;
    });
  }

  onError(Object error) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(Strings.errorOccurred),
            content: Text(error.toString()),
            actions: [FlatButton(onPressed: pop, child: Text(Strings.close))],
          );
        });
  }

  @protected
  writeStorageValue<T>(Object key, T value) {
    PageStorage.of(context).writeState(context, value, identifier: key);
  }

  @protected
  T readStorageValue<T>(Object key) {
    return PageStorage.of(context).readState(context, identifier: key);
  }

  @protected
  push(Widget view, {bool withReplacement = false}) {
    final route = CupertinoPageRoute(builder: (context) => view);
    if (withReplacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }

  pop() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Visibility(visible: _contentVisible, child: create(context)),
      Visibility(
          visible: _isLoading,
          child: Center(child: CircularProgressIndicator())),
    ]);
  }

  Widget create(BuildContext context);
}
