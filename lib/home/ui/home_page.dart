import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_task/utils/app_colors.dart';
import 'package:kib_task/utils/dimensions.dart';
import 'package:kib_task/utils/text_styles.dart';
import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        return HomeCubit();
      },
      child: Scaffold(
        body: HomeBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //TODO
          },
        ),
      ),
    );
  }

}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Preparing",
        style: TextStyles.regular(
          color: AppColors.textPrimaryColor,
          fontSize: Dimensions.normal
        ),
      ),
    );
  }
}