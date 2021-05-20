import 'package:flutter/cupertino.dart';

class SettingsItems {
  final String itemTitle;
  final String itemDesc;
  final Function() onItemTap;
  final IconData itemIcon;

  SettingsItems(this.itemTitle, this.itemDesc, this.onItemTap, this.itemIcon);
}
