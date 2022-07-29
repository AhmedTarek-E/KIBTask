import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kib_task/utils/app_colors.dart';
import 'package:kib_task/utils/text_styles.dart';

import 'dimensions.dart';

void logDebug(Object? object) {
  if (kDebugMode) {
    print(object);
  }
}

Future<T?> pushMaterialPage<T>(
    BuildContext context,
    Widget page,
    {
      bool rootNavigator = false,
      RouteSettings? settings,
      bool fullscreenDialog = false
    }) {
  return Navigator.of(context, rootNavigator: rootNavigator)
      .push(MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog
  ));
}

bool isRTL(String text) {
  return Bidi.detectRtlDirectionality(text);
}

void showErrorSnackBar(BuildContext context, String errorMessage, {
  Duration duration = const Duration(seconds: 3)
}) {
  logDebug(errorMessage);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: SnackBarAction(
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      label: "Hide",
      textColor: AppColors.textTertiaryColor,
    ),
    duration: duration,
    backgroundColor: Colors.red,
    content: Row(
      children: [
        Expanded(
          child: Text(
            errorMessage,
            style: TextStyles.medium(
                color: Colors.white,
                fontSize: Dimensions.normal
            ),
            textAlign: isRTL(errorMessage) ? TextAlign.start : TextAlign.end,
          ),
        ),
      ],
    ),
  ));
}

void showSuccessSnackBar(BuildContext context, String message,
    {VoidCallback? onDismissed}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 3),
    backgroundColor: AppColors.successLight,
    content: Row(
      children: [
        Expanded(
          child: Text(
            message,
            style: TextStyles.regular(
              color: AppColors.success,
              fontSize: Dimensions.normal,
            ),
          ),
        ),
      ],
    ),
  ));

  if (onDismissed != null) {
    Timer(const Duration(seconds: 3), () {
      onDismissed();
    });
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));