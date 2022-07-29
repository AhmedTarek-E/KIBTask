

import 'package:flutter/material.dart';

class Dimensions {
  Dimensions._();
  static late bool isMobile;
  static late bool isPortrait;

  static double get xSmall => isMobile ? 12 : 12;
  static double get small => isMobile ? 14 : 14;
  static double get normal => isMobile ? 16 : 16;
  static double get large => isMobile ? 18 : 18;
  static double get xLarge => isMobile ? 20 : 20;
  static double get xxLarge => isMobile ? 22 : 22;
  static double get header => isMobile ? 26 : 26;

  static double get buttonHeight => isMobile ? 48 : 64;
  static double get buttonMiniHeight => isMobile ? 32 : 48;
  static const double actionButtonHeight = 100;
  static const double textHeight = 36;
  static final double pickerItemHeight = isMobile ? 30 : 60;

  static double get leadingWidth => IconDimensions.medium + pageSmallMargins.right;

  static double get toolbarHeight => isMobile ? kToolbarHeight : 72;

  static EdgeInsets pageMargins =
      EdgeInsets.symmetric(horizontal: PaddingDimensions.xxLarge);
  static EdgeInsets pageSmallMargins =
      EdgeInsets.symmetric(horizontal: PaddingDimensions.large);

  static EdgeInsets get formMargins => EdgeInsets.symmetric(
      horizontal: isMobile ? 32 : 128
  );
}

class IconDimensions {
  IconDimensions._();

  static double get xSmall => Dimensions.isMobile ? 16 : 24;
  static double get small => Dimensions.isMobile ? 24 : 32;
  static double get medium => Dimensions.isMobile ? 32 : 40;
}

class PaddingDimensions {
  PaddingDimensions._();

  static double get small => Dimensions.isMobile ? 4 : 8;
  static double get normal => Dimensions.isMobile ? 8 : 12;
  static double get large => Dimensions.isMobile ? 16 : 24;
  static double get xLarge => Dimensions.isMobile ? 24 : 32;
  static double get xxLarge => Dimensions.isMobile ? 32 : 40;
}

class CustomAppDimensions {
  CustomAppDimensions._();

}
