import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'BaseViewCallback.dart';

abstract class BasePresenter<V extends BaseViewCallback> {
  V view;

  StreamSubscription<ConnectivityResult> connectivitySubscription;

  @mustCallSuper
  init() {
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      onConnectionChanged(isConnection(result));
    });
    connectivitySubscription.resume();
  }

  @mustCallSuper
  dispose() {
    connectivitySubscription.cancel();
    view = null;
  }

  listenToConnectivityChanges(bool shouldListen) {
    if (shouldListen) {
      connectivitySubscription.resume();
    } else {
      connectivitySubscription.pause();
    }
  }

  @protected
  onConnectionChanged(bool isConnection) {}

  @protected
  isConnection(ConnectivityResult connectivityResult) {
    return connectivityResult != ConnectivityResult.none;
  }
}
