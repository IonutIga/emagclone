import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emag/src/data/auth_api.dart';
import 'package:emag/src/epics/app_epics.dart';
import 'package:emag/src/models/index.dart';
import 'package:emag/src/reducer/reducer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

Future<Store<AppState>> init() async {
  Firebase.initializeApp();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final AuthApi authApi = AuthApi(auth: auth, firestore: firestore);

  final AppEpics epics = AppEpics(authApi: authApi);
  final AppState initialState = AppState.initialState();

  return Store<AppState>(reducer,
      initialState: initialState, middleware: <Middleware<AppState>>[EpicMiddleware<AppState>(epics.epics)]);
}
