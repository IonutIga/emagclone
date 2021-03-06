import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emag/src/models/auth/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthApi {
  const AuthApi({@required FirebaseAuth auth, @required FirebaseFirestore firestore})
      : assert(auth != null),
        assert(firestore != null),
        _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<AppUser> login({@required String email, @required String password}) async {
    final UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    final DocumentSnapshot snapshot = await _firestore.doc('/users/${result.user.uid}').get();

    return AppUser.fromJson(snapshot.data());
  }
}
