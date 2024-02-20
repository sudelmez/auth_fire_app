import 'package:auth_fire_app/product/login/login_view.dart';
import 'package:auth_fire_app/product/register/register_view.dart';
import 'package:auth_fire_app/product/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import '../../../../product/home/home_view.dart';
import '../../../modules/user/user.dart';
import 'navigation_service.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationPaths.home:
        Map<String, dynamic> arguments = args.arguments as Map<String, dynamic>;
        UserModel? user = arguments["user"];
        return normalNavigate(HomeView(user: user));
      case NavigationPaths.login:
        return normalNavigate(const LoginView());
      case NavigationPaths.register:
        return normalNavigate(const RegisterView());
      default:
        return normalNavigate(const SplashView());
    }
  }

  PageRoute normalNavigate(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget);
  }

  PageRoute normalNavigateToPop(Widget widget) {
    return CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true);
  }
}
