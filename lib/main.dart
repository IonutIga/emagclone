
import 'package:emag/src/models/index.dart';
import 'package:emag/src/presentation/mixin/init_mixin.dart';
import 'package:emag/src/presentation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


void main() {
  runApp(const Emag());
}

class Emag extends StatefulWidget {
  const Emag({Key key}) : super(key: key);

  @override
  _EmagState createState() => _EmagState();
}

class _EmagState extends State<Emag> with InitMixin<Emag>{


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store<AppState>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<Store<AppState>> snapshot) {
        if (snapshot.hasData) {
          final Store<AppState> store = snapshot.data;
          return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
              title: 'Emag Clone',
              theme: ThemeData.dark(),
              routes: AppRoutes.routes,
            ),
          );
        } else {
          if (snapshot.hasError)
            throw snapshot.error;
        }

        return MaterialApp(
          title: 'Emag Clone',
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: Center(
              child: FlutterLogo(
                size: 200,
              ),
            ),
          ),
        );
      },
    );
  }
}
