import 'package:auth_fire_app/core/base/view/base_view.dart';
import 'package:auth_fire_app/core/component/custom_appbar.dart';
import 'package:auth_fire_app/product/register/register_model.dart';
import 'package:auth_fire_app/product/register/register_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../core/base/modules/alert/alert_manager.dart';
import '../../core/component/custom_button.dart';
import '../../core/component/custom_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewModel with RegisterModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: CustomAppBar(
        title: button,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomField(
              hint: name,
              controller: namecontroller,
            ),
            CustomField(
              hint: lastname,
              controller: lastnamecontroller,
            ),
            CustomField(
              hint: email,
              controller: mailcontroller,
            ),
            CustomField(
              hint: birth,
              controller: birthcontroller,
            ),
            CustomField(
              hint: bio,
              controller: biocontroller,
            ),
            CustomButton(
              onPressed: () {
                if (mailcontroller.text.isEmpty || namecontroller.text.isEmpty || lastnamecontroller.text.isEmpty || birthcontroller.text.isEmpty) {
                  AlertManager.instance.showSnack(SnackType.error, message: errormessage);
                } else {
                  SignUp();
                }
              },
              text: button,
            ),
          ],
        ),
      ),
    );
  }
}
