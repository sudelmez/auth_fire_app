import 'package:auth_fire_app/core/base/modules/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButton;
  final bool isLogout;
  final Function()? onTap;
  const CustomAppBar({super.key, this.onTap, this.isBackButton = true, this.isLogout = false, this.title});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      leading: isBackButton
          ? IconButton(
              onPressed: () {
                NavigationService.instance.navigatePop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp))
          : const SizedBox(),
      actions: [isLogout ? IconButton(onPressed: onTap, icon: const Icon(Icons.logout_sharp)) : const SizedBox()],
    );
  }
}
