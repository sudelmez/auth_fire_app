import 'package:auth_fire_app/firebase_options.dart';
import 'package:auth_fire_app/product/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/base/modules/alert/alert_manager.dart';
import 'core/base/modules/navigation/navigation_route.dart';
import 'core/base/modules/navigation/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      scaffoldMessengerKey: AlertManager.instance.alertKey,
      title: 'Auth App',
      home: const SplashView(),
    );
  }
}
