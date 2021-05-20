import 'package:flutter/material.dart';
import 'package:flutter_amv/colors.dart';
import 'package:flutter_amv/fund_borrow_selector.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        "Log in to your Astra Ventura account.",
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
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
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Reset Password"),
                    ),
                  ),
                  DefElevButton(
                    btnText: "LOG IN",
                    onButtonPressed: () {},
                  ),
                  DefElevButton(
                    btnText: "CREATE ACCOUNT",
                    onButtonPressed: () {
                      Get.to(() => FBSelector());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefElevButton extends StatelessWidget {
  const DefElevButton({
    Key key,
    @required this.btnText,
    @required this.onButtonPressed,
  }) : super(key: key);

  final String btnText;
  final Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 50,
      child: ElevatedButton(
        onPressed: onButtonPressed,
        child: Text(
          btnText,
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: kWhite),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class DefTextField extends StatelessWidget {
  const DefTextField({
    Key key,
    @required this.inputText,
    @required this.inputType,
    @required this.prefIcon,
    this.obscureText,
  }) : super(key: key);

  final String inputText;
  final TextInputType inputType;
  final bool obscureText;
  final IconData prefIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(inputText),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: inputType,
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: kWhite,
              prefixIcon: Icon(prefIcon),
              filled: true,
              hintText: inputText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: kPrimaryGrey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: kPrimaryColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
