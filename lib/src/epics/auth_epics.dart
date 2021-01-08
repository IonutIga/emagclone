import 'package:emag/src/actions/auth/index.dart';
import 'package:emag/src/actions/index.dart';
import 'package:emag/src/data/auth_api.dart';
import 'package:emag/src/models/auth/index.dart';
import 'package:emag/src/models/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AuthEpics{
const AuthEpics({@required AuthApi api}):assert(api != null),
_api = api;

final AuthApi _api;

  Epic<AppState> get epics{
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, Login$ >(_login),

    ]);
  }

  Stream<AppAction> _login(Stream<Login$> actions, EpicStore<AppState> store){

    return actions //
    ..asyncMap((Login$ action) => _api.login(email: action.email, password: action.password))
        .map((AppUser user) => LoginSuccessful(user))
    .onErrorReturnWith((dynamic error) => Login.error(error));

  }
}