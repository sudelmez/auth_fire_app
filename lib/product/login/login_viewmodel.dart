import 'package:auth_fire_app/core/base/state/base_state.dart';
import 'package:auth_fire_app/core/modules/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/base/modules/auth/firebase_method.dart';
import 'login_view.dart';

abstract class LoginViewModel extends BaseState<LoginView> {
  TextEditingController mailcontroller = TextEditingController();
  UserModel? user;
  UserModel? userE;
  @override
  void initState() {
    super.initState();
  }

  void SignIn() async {
    user = await FirebaseAuthMethod(FirebaseAuth.instance).signIn(user: UserModel(email: mailcontroller.text), context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
