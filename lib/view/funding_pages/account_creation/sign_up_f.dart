import 'package:flutter/material.dart';
import 'package:flutter_amv/controller/navbar_controller.dart';
import 'package:flutter_amv/view/borrow_pages/account_creation/sign_up_b.dart';
import 'package:flutter_amv/view/login_pages/login_page.dart';
import 'package:get/get.dart';

import '../../../colors.dart';
import '../../../fund_borrow_selector.dart';

class SignUpFund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlainAppBar(
        appBarTitle: "Create Account (Funder)",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LogoHeader(
                  header: "Create a new Astra Ventura account as a funder.",
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
                                Get.offAll(() => FundNavController());
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
