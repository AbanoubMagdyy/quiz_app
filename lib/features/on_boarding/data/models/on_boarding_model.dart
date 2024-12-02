import 'package:flutter/material.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  final Color mainColor;
  final Color secondColor;

  OnBoardingModel({
    required this.image,
    required this.mainColor,
    required this.secondColor,
    required this.title,
    required this.body,
  });
}
