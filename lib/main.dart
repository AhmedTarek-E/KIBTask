import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kib_task/utils/app_colors.dart';
import 'package:kib_task/utils/dimensions_initializer.dart';

import 'firebase_options.dart';
import 'home/di/app_injector.dart';
import 'home/ui/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();
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
