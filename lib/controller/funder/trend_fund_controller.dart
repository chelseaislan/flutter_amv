import 'package:flutter_amv/model/funder/fund_status.dart';
import 'package:get/get.dart';

class TrendFundController extends GetxController {
  var trendingFund = <TrendingFundings>[].obs;

  @override
  void onInit() {
    fetchTrends();
    super.onInit();
  }

  void fetchTrends() {
    var trendsList = [
      TrendingFundings("Pendanaan PT ISK", 13.0, "C", 43),
      TrendingFundings("Pendanaan PT FMA", 13.0, "A", 87),
      TrendingFundings("Pendanaan PT QNF", 13.0, "B+", 65),
    ];
    trendingFund.assignAll(trendsList);
  }
}

class MPFundController extends GetxController {
  var mpFund = <MPFundings>[].obs;

  @override
  void onInit() {
    fetchMPFunds();
    super.onInit();
  }

  void fetchMPFunds() {
    var mpFundsList = [
      MPFundings(
        "Pendanaan PT JEP",
        14.0,
        "A+",
        98,
        "fundImageURL",
        "280.000.000",
        "Invoice Financing",
      ),
      MPFundings(
        "Pendanaan PT JEP",
        14.0,
        "A+",
        98,
        "fundImageURL",
        "280.000.000",
        "Invoice Financing",
      ),
      MPFundings(
        "Pendanaan PT JEP",
        14.0,
        "A+",
        98,
        "fundImageURL",
        "280.000.000",
        "Invoice Financing",
      ),
    ];
    mpFund.assignAll(mpFundsList);
  }
}
