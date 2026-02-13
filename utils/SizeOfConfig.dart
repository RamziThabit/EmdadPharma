import 'package:flutter/material.dart';

class SizeOfConfig {

  static late Size _mediaQueryData;
  static late double heightScreen;
  static late double widthScreen;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context).size;
    widthScreen = _mediaQueryData.width;
    heightScreen = _mediaQueryData.height;
  }
}

double getProportionalWidth(double inputWidth) {
  double widthScreen = SizeOfConfig.widthScreen;
  return (inputWidth / 360) * widthScreen;
}

double getProportionalHeight(double inputHeight) {
  double heightScreen = SizeOfConfig.heightScreen;
  return (inputHeight / 806) * heightScreen;
}