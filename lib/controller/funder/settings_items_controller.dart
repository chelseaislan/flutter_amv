import 'package:flutter/material.dart';
import 'package:flutter_amv/model/funder/settings_items.dart';
import 'package:get/get.dart';

class SettingsItemsController extends GetxController {
  var settingsItems = <SettingsItems>[].obs;

  @override
  void onInit() {
    fetchSettings();
    super.onInit();
  }

  void fetchSettings() {
    var settingsList = [
      SettingsItems(
        "Edit Profile",
        "Change your avatar, email address, phone, and password",
        () {},
        Icons.account_circle_rounded,
      ),
      SettingsItems(
        "Application Settings",
        "Change the language, theme, and opting out analytics.",
        () {},
        Icons.settings_outlined,
      ),
      SettingsItems(
          "Terms of Use",
          "See the terms you have accepted in the beginning.",
          () {},
          Icons.my_library_books_outlined),
      SettingsItems(
        "About Us",
        "From history about us, vision and missions, to our values.",
        () {},
        Icons.info_outline_rounded,
      ),
      SettingsItems(
        "Log Out",
        "You can log back in later.",
        () {},
        Icons.logout,
      ),
    ];
    settingsItems.assignAll(settingsList);
  }
}
