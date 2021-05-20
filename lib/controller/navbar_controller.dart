import 'package:flutter/material.dart';
import 'package:flutter_amv/view/funding_pages/navbar_pages_fund/account_page_fund.dart';
import 'package:flutter_amv/view/funding_pages/navbar_pages_fund/funding_marketplace.dart';
import 'package:flutter_amv/view/funding_pages/navbar_pages_fund/funding_portfolio.dart';
import 'package:flutter_amv/view/funding_pages/navbar_pages_fund/home_page_fund.dart';

import '../colors.dart';

class FundNavController extends StatefulWidget {
  @override
  _FundNavControllerState createState() => _FundNavControllerState();
}

class _FundNavControllerState extends State<FundNavController> {var selectedIndex = 0;
  var widgetOptions = [
    HomePageF(),
    FundingMarket(),
    FundingPortfolio(),
    AccountPageF(),
  ];

  void onItemTap(var index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kSecondaryGrey,
        type: BottomNavigationBarType.fixed,
        items: [
          bottomNavBarItem(Icons.home_outlined, "Home"),
          bottomNavBarItem(Icons.shop_two_outlined, "Marketplace"),
          bottomNavBarItem(Icons.bar_chart_outlined, "Portfolio"),
          bottomNavBarItem(Icons.account_circle_outlined, "Account"),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTap,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryGrey,
        selectedLabelStyle: Theme.of(context).textTheme.subtitle1,
        unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(navBarIconData, navBarText) {
    return BottomNavigationBarItem(
      icon: Icon(navBarIconData),
      label: navBarText,
      tooltip: navBarText,
    );
  }
}

class BorrowNavController extends StatefulWidget {
  @override
  _BorrowNavControllerState createState() => _BorrowNavControllerState();
}

class _BorrowNavControllerState extends State<BorrowNavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}