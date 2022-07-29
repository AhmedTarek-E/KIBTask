import 'package:flutter/material.dart';
import 'package:kib_task/utils/app_colors.dart';
import 'package:kib_task/utils/dimensions_initializer.dart';

import 'home/ui/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KIB Task',
      color: AppColors.appBackgroundColor,
      theme: ThemeData(primaryColor: AppColors.primaryColor),
      home: const DimensionsInitializer(child: HomePage()),
    );
  }
}
