import 'package:flutter/material.dart';
import 'package:flutter_amv/colors.dart';
import 'package:flutter_amv/view/borrow_pages/account_creation/sign_up_b.dart';
import 'package:flutter_amv/view/funding_pages/account_creation/sign_up_f.dart';
import 'package:flutter_amv/view/login_pages/login_page.dart';
import 'package:get/get.dart';

class FBSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlainAppBar(
        appBarTitle: "Sign Up",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/02.png"),
              Container(
                padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  "Dapatkan fasilitas pembiayaan dan penyertaan modal dari Astra Ventura yang sesuai dengan kebutuhan bisnis Anda.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              DefElevButton(
                btnText: "SAYA MAU MENGAJUKAN PINJAMAN",
                onButtonPressed: () {
                  Get.to(() => SignUpBorrow());
                },
              ),
              DefElevButton(
                btnText: "SAYA MAU MENDANAI",
                onButtonPressed: () {
                  Get.to(() => SignUpFund());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlainAppBar extends StatelessWidget with PreferredSizeWidget {
  const PlainAppBar({
    Key key,
    this.appBarTitle,
  }) : super(key: key);

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      backgroundColor: Colors.grey[50],
      elevation: 0,
      iconTheme: IconThemeData(color: kPrimaryBlack),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
