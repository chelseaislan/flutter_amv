import 'package:flutter/material.dart';

class HomeFundStatus {
  final String title;
  final int numbers;
  final Color backColor;

  HomeFundStatus(this.title, this.numbers, this.backColor);
}

class TrendingFundings {
  final String fundTitle;
  final double fundInterest;
  final String fundGrade;
  final int fundProgress;

  TrendingFundings(
      this.fundTitle, this.fundInterest, this.fundGrade, this.fundProgress);
}

class MPFundings {
  final String fundTitle;
  final double fundInterest;
  final String fundGrade;
  final int fundProgress;
  final String fundImageURL;
  final String fundTotalAmount;
  final String fundType;

  MPFundings(
    this.fundTitle,
    this.fundInterest,
    this.fundGrade,
    this.fundProgress,
    this.fundImageURL,
    this.fundTotalAmount,
    this.fundType,
  );
}
