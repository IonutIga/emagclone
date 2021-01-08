import 'package:emag/src/containers/auth/index.dart';
import 'package:emag/src/models/auth/index.dart';
import 'package:emag/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

import 'login/login_page.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser user) {
        if (user == null) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
