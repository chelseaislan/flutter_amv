import 'package:flutter/material.dart';
import 'package:flutter_amv/colors.dart';
import 'package:flutter_amv/controller/funder/fund_status_controller.dart';
import 'package:flutter_amv/controller/funder/news_events_controller.dart';
import 'package:flutter_amv/controller/funder/trend_fund_controller.dart';
import 'package:flutter_amv/view/login_pages/login_page.dart';
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
            height: 1600,
            padding: EdgeInsets.symmetric(horizontal: 15),
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
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Your Current Statistics",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
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
                          return FundStatus(
                            backColor: controller.fundStatus[index].backColor,
                            title: controller.fundStatus[index].title,
                            numbers: controller.fundStatus[index].numbers,
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Trending Fundings",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: GetX<TrendFundController>(
                    init: TrendFundController(),
                    initState: (_) {},
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.trendingFund.length,
                        itemBuilder: (context, index) {
                          return TrendingFundings(
                            fundTitle: controller.trendingFund[index].fundTitle,
                            fundGrade: controller.trendingFund[index].fundGrade,
                            fundInterest:
                                controller.trendingFund[index].fundInterest,
                            fundProgress:
                                controller.trendingFund[index].fundProgress,
                          );
                        },
                      );
                    },
                  ),
                ),
                DefElevButton(btnText: "Find More", onButtonPressed: () {}),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "News & Events",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Container(
                  height: 360,
                  child: GetX<NewsEventsController>(
                    init: NewsEventsController(),
                    initState: (_) {},
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        itemCount: controller.newsEvents.length,
                        itemBuilder: (context, index) {
                          return NewsEventsContainer(
                            newsImageURL:
                                controller.newsEvents[index].newsImageURL,
                            newsTitle: controller.newsEvents[index].newsTitle,
                            newsAuthor: controller.newsEvents[index].newsAuthor,
                            newsDate: controller.newsEvents[index].newsDate,
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

class TrendingFundings extends StatelessWidget {
  const TrendingFundings({
    Key key,
    this.fundTitle,
    this.fundInterest,
    this.fundGrade,
    this.fundProgress,
  }) : super(key: key);

  final String fundTitle;
  final double fundInterest;
  final String fundGrade;
  final int fundProgress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
    );
  }
}

class FundStatus extends StatelessWidget {
  const FundStatus({
    Key key,
    this.title,
    this.numbers,
    this.backColor,
  }) : super(key: key);

  final String title;
  final int numbers;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.left,
          ),
          Text(
            numbers.toString(),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class NewsEventsContainer extends StatelessWidget {
  const NewsEventsContainer({
    Key key,
    this.newsImageURL,
    this.newsTitle,
    this.newsAuthor,
    this.newsDate,
    this.onItemTap,
  }) : super(key: key);

  final String newsImageURL;
  final String newsTitle;
  final String newsAuthor;
  final String newsDate;
  final Function() onItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 0.5,
            color: kSecondaryGrey,
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(
              newsImageURL,
              height: 150,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      newsAuthor,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      newsDate,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: DefElevButton(
              btnText: "Read More",
              onButtonPressed: onItemTap,
            ),
          ),
        ],
      ),
    );
  }
}
