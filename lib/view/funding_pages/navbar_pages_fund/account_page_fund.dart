import 'package:flutter/material.dart';
import 'package:flutter_amv/controller/funder/settings_items_controller.dart';
import 'package:get/get.dart';

import '../../../colors.dart';

class AccountPageF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          "My Account",
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: kWhite),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: kWhite,
                  radius: 50,
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 900,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: GetX<SettingsItemsController>(
              init: SettingsItemsController(),
              initState: (_) {},
              builder: (controller) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.settingsItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      focusColor: kPrimaryGrey,
                      onTap: controller.settingsItems[index].onItemTap,
                      child: Container(
                        child: Row(
                          children: [
                            Icon(controller.settingsItems[index].itemIcon),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.settingsItems[index].itemTitle),
                                Text(controller.settingsItems[index].itemDesc),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
