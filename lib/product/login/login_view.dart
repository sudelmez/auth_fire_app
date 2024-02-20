import 'package:auth_fire_app/core/base/modules/alert/alert_manager.dart';
import 'package:auth_fire_app/core/base/modules/navigation/navigation_service.dart';
import 'package:auth_fire_app/core/base/view/base_view.dart';
import 'package:auth_fire_app/core/component/custom_appbar.dart';
import 'package:auth_fire_app/core/component/custom_button.dart';
import 'package:auth_fire_app/core/component/custom_field.dart';
import 'package:auth_fire_app/product/login/login_model.dart';
import 'package:auth_fire_app/product/login/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel with LoginModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: const CustomAppBar(
        isBackButton: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomField(
            hint: email,
            controller: mailcontroller,
          ),
          CustomButton(
            onPressed: () {
              if (mailcontroller.text.isEmpty) {
                AlertManager.instance.showSnack(SnackType.error, message: errormessage);
              } else {
                SignIn();
              }
            },
            text: button,
          ),
          TextButton(onPressed: () => NavigationService.instance.navigateToPage(path: NavigationPaths.register), child: Text(register))
        ],
      ),
    );
  }
}
