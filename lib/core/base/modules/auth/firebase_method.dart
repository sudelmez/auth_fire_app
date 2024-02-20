import 'package:auth_fire_app/core/base/modules/alert/alert_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../modules/user/user.dart';
import '../navigation/navigation_service.dart';

class FirebaseAuthMethod {
  final FirebaseAuth _auth;
  final userCollection = FirebaseFirestore.instance.collection("users");
  FirebaseAuthMethod(this._auth);

  Future<void> setUserDatas({required UserModel user, required BuildContext context}) async {
    try {
      DocumentReference docRef =
          await userCollection.add({"email": user.email, "name": user.name, "lastname": user.lastname, "birthDate": user.birthDate, "bio": user.bio, "hobbies": user.hobbies, "userId": user.userId});
      user.docRef = docRef.id;
      AlertManager.instance.showSnack(SnackType.success, message: "Kayıt Edildi");
    } on FirebaseAuthException catch (e) {
      AlertManager.instance.showSnack(SnackType.error, message: e.message);
    }
  }

  Future<void> updateUserDatas({required UserModel user, required BuildContext context}) async {
    try {
      DocumentReference docRef = userCollection.doc(user.docRef);
      await docRef.update({"hobbies": user.hobbies});
      AlertManager.instance.showSnack(SnackType.success, message: "Kayıt Güncellendi");
    } on FirebaseAuthException catch (e) {
      AlertManager.instance.showSnack(SnackType.error, message: e.message);
    }
  }

  Future<UserModel?> getUserDatas({
    required UserModel user,
    required BuildContext context,
    required String id,
  }) async {
    try {
      final snapshot = await userCollection.get();
      for (var doc in snapshot.docs) {
        if (doc["email"] == user.email) {
          final userData = doc.data();
          AlertManager.instance.showSnack(SnackType.success, message: "Giriş Yapıldı");
          final finaluserData = UserModel.fromJson(userData, id: id);
          NavigationService.instance.navigateToPage(path: NavigationPaths.home, arguments: {"user": finaluserData});
          return finaluserData;
        }
      }
      AlertManager.instance.showSnack(SnackType.warning, message: "Veri Bulunamadı.");
      return null;
    } on FirebaseAuthException catch (e) {
      AlertManager.instance.showSnack(SnackType.error, message: e.message);
      return null;
    }
  }

  Future<void> register({required UserModel user, required BuildContext context}) async {
    try {
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(email: user.email!, password: "Password123");
      if (credential.user != null) {
        user.userId = credential.user!.uid;
        setUserDatas(user: user, context: context);
      }
      NavigationService.instance.navigateToPage(path: NavigationPaths.home, arguments: {"user": user});
    } on FirebaseAuthException catch (e) {
      AlertManager.instance.showSnack(SnackType.error, message: e.message);
    }
  }

  Future<UserModel?> signIn({required UserModel user, required BuildContext context}) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(email: user.email!, password: "Password123");
      if (credential.user != null) {
        String userId = credential.user!.uid;
        await getUserDatas(user: user, context: context, id: userId);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      AlertManager.instance.showSnack(SnackType.error, message: e.message);
      return null;
    }
    return null;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    NavigationService.instance.navigateToPage(path: NavigationPaths.login);
  }
}
