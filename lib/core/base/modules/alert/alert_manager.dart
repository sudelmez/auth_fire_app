import 'package:auth_fire_app/core/component/custom_field.dart';
import 'package:flutter/material.dart';

class AlertManager {
  static AlertManager? _instance;
  static AlertManager get instance {
    _instance ??= AlertManager._init();
    return _instance!;
  }

  AlertManager._init();

  final GlobalKey<ScaffoldMessengerState> alertKey = GlobalKey<ScaffoldMessengerState>();
  void showSnack(SnackType type, {String? message}) {
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(message ?? type.message),
      backgroundColor: type.color,
    );
    alertKey.currentState?.showSnackBar(snackBar);
  }

  void showCustomFieldDialog(BuildContext context, TextEditingController controller, Function() onPress) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: CustomField(hint: 'Hobi Girin', controller: controller),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                onPress();
                Navigator.of(context).pop();
              },
              child: const Text('Ekle'),
            ),
          ],
        );
      },
    );
  }
}

enum SnackType {
  error(Color(0xffF7444E), "HATA"),
  warning(Color(0xffFD9D42), "UYARI"),
  added(Color(0xffFD9D42), "HOBİLERE EKLENDİ"),
  success(Color(0xff328048), "BAŞARILI");

  final Color color;
  final String message;
  const SnackType(this.color, this.message);
}
