import 'package:emag/src/data/auth_api.dart';
import 'package:emag/src/epics/auth_epics.dart';
import 'package:emag/src/models/index.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';

class AppEpics{

  const AppEpics({@required AuthApi authApi}):assert(authApi != null),
        _authApi = authApi;

  final AuthApi _authApi;

  Epic<AppState> get epics{
    return combineEpics(<Epic<AppState>>[
      AuthEpics(api: _authApi).epics,

    ]);
  }

}