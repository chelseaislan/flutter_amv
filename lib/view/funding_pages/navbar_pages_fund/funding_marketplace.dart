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
                return Container(
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
                    children: [
                      // image fund image url
                      Text(controller.mpFund[index].fundTitle),
                      Text(controller.mpFund[index].fundInterest.toString()),
                      Text(controller.mpFund[index].fundGrade),
                      Text(controller.mpFund[index].fundProgress.toString()),
                      Text(controller.mpFund[index].fundTotalAmount),
                      Text(controller.mpFund[index].fundType),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
