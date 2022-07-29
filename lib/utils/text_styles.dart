import 'package:flutter/material.dart';

class
TextStyles {
  static TextStyle regular(
          {Color color = Colors.black,
          double fontSize = 14.0,
          double? height}) =>
      TextStyle(
          height: height,
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: fontSize
      );

  static TextStyle bold({Color color = Colors.black, double fontSize = 14.0}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: fontSize);

  static TextStyle boldUnderlined(
          {Color color = Colors.black, double fontSize = 14.0}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
          decoration: TextDecoration.underline);

  static TextStyle regularUnderlined(
          {Color color = Colors.black, double fontSize = 14.0}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: fontSize,
          decoration: TextDecoration.underline);

  static TextStyle medium(
          {Color color = Colors.black, double fontSize = 14.0}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: fontSize);

  static TextStyle semiBold(
          {Color color = Colors.black, double fontSize = 14.0}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: fontSize);

  static TextStyle thin({Color color = Colors.black, double fontSize = 14.0}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w100,
          fontSize: fontSize);
}
