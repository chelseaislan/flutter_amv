import 'package:flutter/material.dart';
import 'package:flutter_amv/model/funder/fund_status.dart';
import 'package:get/get.dart';

class FundStatusController extends GetxController {
  var fundStatus = <HomeFundStatus>[].obs;

  @override
  void onInit() {
    fetchStatus();
    super.onInit();
  }

  void fetchStatus() {
    var statusList = [
      HomeFundStatus("Current Fundings", 0, Colors.blue[50]),
      HomeFundStatus("Successful Fundings", 0, Colors.green[50]),
      HomeFundStatus("Risky Fundings", 0, Colors.red[50]),
      HomeFundStatus("Canceled Fundings", 0, Colors.amber[50]),
    ];

    fundStatus.assignAll(statusList);
  }
}
