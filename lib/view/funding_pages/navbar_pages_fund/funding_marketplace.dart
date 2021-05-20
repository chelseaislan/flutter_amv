import 'package:flutter/material.dart';
import 'package:flutter_amv/colors.dart';
import 'package:flutter_amv/controller/funder/trend_fund_controller.dart';
import 'package:get/get.dart';

class FundingMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Marketplace",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[50],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetX<MPFundController>(
          init: MPFundController(),
          initState: (_) {},
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.mpFund.length,
              itemBuilder: (context, index) {
                return MPFunds(
                  fundGrade: controller.mpFund[index].fundGrade,
                  fundImageURL: controller.mpFund[index].fundImageURL,
                  fundInterest: controller.mpFund[index].fundInterest,
                  fundProgress: controller.mpFund[index].fundProgress,
                  fundTitle: controller.mpFund[index].fundTitle,
                  fundTotalAmount: controller.mpFund[index].fundTotalAmount,
                  fundType: controller.mpFund[index].fundType,
                  onItemTap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MPFunds extends StatelessWidget {
  const MPFunds({
    Key key,
    this.fundTitle,
    this.fundInterest,
    this.fundGrade,
    this.fundProgress,
    this.fundImageURL,
    this.fundTotalAmount,
    this.fundType,
    this.onItemTap,
  }) : super(key: key);

  final String fundTitle;
  final double fundInterest;
  final String fundGrade;
  final int fundProgress;
  final String fundImageURL;
  final String fundTotalAmount;
  final String fundType;
  final Function onItemTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 0.5,
              color: kPrimaryGrey,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // image fund image url
            Text(fundTotalAmount),
            Text(fundType),
            Text(
              fundTitle,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text("Grade $fundGrade"),
            Text("Interest Rate: $fundInterest%"),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("Funding Progress: $fundProgress%")),
            Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: kSecondaryGrey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: fundProgress / 100,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
