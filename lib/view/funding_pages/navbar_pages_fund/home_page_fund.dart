import 'package:flutter/material.dart';
import 'package:flutter_amv/colors.dart';
import 'package:flutter_amv/controller/funder/fund_status_controller.dart';
import 'package:flutter_amv/controller/funder/trend_fund_controller.dart';
import 'package:get/get.dart';

class HomePageF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          "Starlight (Funder)",
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
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: kPrimaryGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Your Current Statistics",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: GetX<FundStatusController>(
                    init: FundStatusController(),
                    initState: (_) {},
                    builder: (controller) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 100,
                        ),
                        itemCount: controller.fundStatus.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: controller.fundStatus[index].backColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.fundStatus[index].title),
                                Text(controller.fundStatus[index].numbers
                                    .toString()),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(
                  "Trending Fundings",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: GetX<TrendFundController>(
                    init: TrendFundController(),
                    initState: (_) {},
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        itemCount: controller.trendingFund.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: kPrimaryColor,
                            child: Column(
                              children: [
                                Text(controller.trendingFund[index].fundTitle),
                                Text(controller.trendingFund[index].fundGrade),
                                Text(controller.trendingFund[index].fundInterest
                                    .toString()),
                                Text(controller.trendingFund[index].fundProgress
                                    .toString()),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Text(
                  "News & Events",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: GetX<TrendFundController>(
                    init: TrendFundController(),
                    initState: (_) {},
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        itemCount: controller.trendingFund.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: kPrimaryColor,
                            child: Column(
                              children: [
                                Text(controller.trendingFund[index].fundTitle),
                                Text(controller.trendingFund[index].fundGrade),
                                Text(controller.trendingFund[index].fundInterest
                                    .toString()),
                                Text(controller.trendingFund[index].fundProgress
                                    .toString()),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
