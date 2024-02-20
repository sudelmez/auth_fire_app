import 'package:auth_fire_app/core/base/modules/navigation/navigation_service.dart';
import 'package:auth_fire_app/core/base/view/base_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => NavigationService.instance.navigateToPage(path: NavigationPaths.login));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseView(
      scaffoldBackgroundColor: Colors.white,
      body: Center(
        child: Icon(
          Icons.star,
          size: 65,
          color: Colors.amber,
        ),
      ),
    );
  }
}
