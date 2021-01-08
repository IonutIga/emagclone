import 'dart:async';

import 'package:emag/init/init.dart';
import 'package:emag/src/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

mixin InitMixin<S extends StatefulWidget> on State<S> {
  final Completer<Store<AppState>> _completer = Completer<Store<AppState>>();

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  Future<void> _initStore() async {
    final List<dynamic> result = await Future.wait<dynamic>(<Future<void>>[
      init(),
      Future<void>.delayed(const Duration(seconds: 3)),
    ]);
    _completer.complete(result[0]);
  }

  Future<Store<AppState>> get future => _completer.future;
}
