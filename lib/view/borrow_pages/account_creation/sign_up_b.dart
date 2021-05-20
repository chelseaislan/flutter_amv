import 'package:flutter/material.dart';
import 'package:flutter_amv/colors.dart';
import 'package:flutter_amv/controller/navbar_controller.dart';
import 'package:flutter_amv/view/login_pages/login_page.dart';
import 'package:get/get.dart';

import '../../../fund_borrow_selector.dart';

class SignUpBorrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlainAppBar(
        appBarTitle: "Create Account (Borrower)",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LogoHeader(
                  header: "Create a new Astra Ventura account as a borrower.",
                ),
                DefTextField(
                  inputText: "Company Type",
                  inputType: TextInputType.name,
                  prefIcon: Icons.info_outlined,
                  obscureText: false,
                ),
                DefTextField(
                  inputText: "Company Name",
                  inputType: TextInputType.name,
                  prefIcon: Icons.location_city_outlined,
                  obscureText: false,
                ),
                DefSignUpForms(),
                Container(
                  padding: EdgeInsets.only(bottom: 20, top: 30),
                  alignment: Alignment.center,
                  child: Text(
                    "I agree to the terms and conditions of PT Astra Mitra Ventura.",
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ),
                DefElevButton(
                  btnText: "CREATE ACCOUNT",
                  onButtonPressed: () {
                    Get.defaultDialog(
                      title: "Email Verification",
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                "Enter the verification code sent to your registered email address."),
                            Container(
                              margin: const EdgeInsets.fromLTRB(50, 10, 50, 30),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: kWhite,
                                  filled: true,
                                  hintText: "OTP Code",
                                ),
                              ),
                            ),
                            DefElevButton(
                              btnText: "VERIFY",
                              onButtonPressed: () {
                                Get.offAll(() => BorrowNavController());
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DefSignUpForms extends StatelessWidget {
  const DefSignUpForms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefTextField(
          inputText: "Full Name",
          inputType: TextInputType.name,
          prefIcon: Icons.account_circle_outlined,
          obscureText: false,
        ),
        DefTextField(
          inputText: "Phone Number",
          inputType: TextInputType.phone,
          prefIcon: Icons.phone,
          obscureText: false,
        ),
        DefTextField(
          inputText: "Email Address",
          inputType: TextInputType.emailAddress,
          prefIcon: Icons.email_outlined,
          obscureText: false,
        ),
        DefTextField(
          inputText: "Password",
          inputType: TextInputType.text,
          prefIcon: Icons.vpn_key_outlined,
          obscureText: true,
        ),
      ],
    );
  }
}

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    Key key,
    @required this.header,
  }) : super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Image.asset(
            "images/logo.png",
            height: 200,
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 30),
          alignment: Alignment.center,
          child: Text(
            header,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
