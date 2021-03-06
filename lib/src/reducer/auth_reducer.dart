import 'package:emag/src/actions/auth/index.dart';
import 'package:emag/src/models/index.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer =
    combineReducers(<Reducer<AuthState>>[TypedReducer<AuthState, LoginSuccessful>(_loginSuccessful)]);

AuthState _loginSuccessful(AuthState state, LoginSuccessful action) {
  return state.rebuild((AuthStateBuilder b) => b.user = action.user.toBuilder());
}
