import 'package:flutter/material.dart';
import 'package:kib_task/utils/text_styles.dart';

import 'app_colors.dart';
import 'dimensions.dart';

class RetryFailedLoading extends StatelessWidget {
  final String message;
  final String retryButtonTitle;
  final VoidCallback onRetryPressed;
  final bool isRetryLoading;

   const RetryFailedLoading({
    Key? key,
    String? message,
    String? retryButtonTitle,
    required this.onRetryPressed,
    this.isRetryLoading = false,
  })  : message = message ?? "Failed to load",
        retryButtonTitle = retryButtonTitle ?? "Retry",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          message,
          style: TextStyles.semiBold(
              color: AppColors.textPrimaryColor,
              fontSize: Dimensions.large
          ),
        ),

        const SizedBox(height: 16,),
        TextButton(
          onPressed: onRetryPressed,
          child: Text(
            retryButtonTitle,
            style: TextStyles.semiBold(
                color: AppColors.textTertiaryColor,
                fontSize: Dimensions.large),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => AppColors.primaryColor),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 64,
            )),
          ),
        ),
      ],
    );
  }
}
