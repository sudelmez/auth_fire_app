import 'package:auth_fire_app/core/base/modules/auth/firebase_method.dart';
import 'package:auth_fire_app/core/base/state/base_state.dart';
import 'package:auth_fire_app/core/modules/user/user.dart';
import 'package:auth_fire_app/product/register/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class RegisterViewModel extends BaseState<RegisterView> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController birthcontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  void SignUp() async {
    UserModel user = UserModel(email: mailcontroller.text, name: namecontroller.text, lastname: lastnamecontroller.text, birthDate: birthcontroller.text, bio: biocontroller.text, hobbies: []);
    FirebaseAuthMethod(FirebaseAuth.instance).register(user: user, context: context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
