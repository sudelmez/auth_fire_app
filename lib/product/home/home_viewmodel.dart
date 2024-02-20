import 'package:auth_fire_app/core/base/modules/auth/firebase_method.dart';
import 'package:auth_fire_app/core/base/state/base_state.dart';
import 'package:auth_fire_app/product/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  TextEditingController hobbycontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void addHobbies() async {
    setState(() {
      if (hobbycontroller.text != "") {
        widget.user?.hobbies?.add(hobbycontroller.text);
        FirebaseAuthMethod(FirebaseAuth.instance).updateUserDatas(user: widget.user!, context: context);
      }
      hobbycontroller.clear();
    });
  }

  void logout() async {
    await FirebaseAuthMethod(FirebaseAuth.instance).signOut();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
