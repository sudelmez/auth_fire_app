import 'package:auth_fire_app/core/base/modules/alert/alert_manager.dart';
import 'package:auth_fire_app/core/base/view/base_view.dart';
import 'package:auth_fire_app/core/component/custom_appbar.dart';
import 'package:auth_fire_app/core/modules/user/user.dart';
import 'package:auth_fire_app/product/component/info_card.dart';
import 'package:auth_fire_app/product/home/home_model.dart';
import 'package:auth_fire_app/product/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  UserModel? user;
  HomeView({super.key, this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel with HomeModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      floatingActionButton: IconButton(
          onPressed: () {
            AlertManager.instance.showCustomFieldDialog(context, hobbycontroller, addHobbies);
          },
          icon: const Icon(
            Icons.add_box_sharp,
            size: 65,
            color: Colors.cyan,
          )),
      appBar: CustomAppBar(
        onTap: logout,
        isLogout: true,
        title: title,
        isBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InfoCard(
                    color: Colors.cyan,
                    text: widget.user!.name ?? "",
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    color: Colors.cyan,
                    text: widget.user!.lastname ?? "",
                  ),
                ),
              ],
            ),
            InfoCard(
              size: size,
              text: widget.user!.email ?? "",
            ),
            InfoCard(
              size: size,
              text: widget.user!.birthDate ?? "",
            ),
            InfoCard(
              size: size,
              text: widget.user!.bio ?? "",
            ),
            const SizedBox(height: 20),
            InfoCard(
              text: hobbies,
              color: Colors.blueGrey,
              size: size / 2,
            ),
            Visibility(
                visible: widget.user?.hobbies?.isNotEmpty ?? false,
                child: SizedBox(
                  height: deviceHeight / 2,
                  child: ListView.builder(
                      itemCount: widget.user?.hobbies?.length,
                      itemBuilder: ((context, index) {
                        return InfoCard(
                          text: widget.user?.hobbies?[index],
                          color: Colors.amber,
                          size: size,
                        );
                      })),
                )),
            Visibility(visible: widget.user?.hobbies?.isEmpty ?? true, child: Text(addHoby)),
          ],
        ),
      ),
    );
  }
}
