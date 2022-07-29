import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_task/home/di/app_injector.dart';
import 'package:kib_task/home/domain/models/note.dart';
import 'package:kib_task/home/ui/home_page/home_state.dart';
import 'package:kib_task/utils/app_colors.dart';
import 'package:kib_task/utils/dimensions.dart';
import 'package:kib_task/utils/retry_failed_loading.dart';
import 'package:kib_task/utils/text_styles.dart';
import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        return HomeCubit(
          injector(),
          injector(),
        )..onStarted();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Notes",
            style: TextStyles.bold(
              color: AppColors.textTertiaryColor,
              fontSize: Dimensions.xxLarge
            ),
          ),
        ),
        body: const HomeBody(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
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
    final width = MediaQuery.of(context).size.width*2/3;
    return Stack(
      children: [
        Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.notes.isLoading) {
                return const CircularProgressIndicator.adaptive();
              }
              return Container();
            },
          ),
        ),

        Center(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.notes.isFailure) {
                return RetryFailedLoading(
                  onRetryPressed: () {
                    //TODO
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),

        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.notes.isSuccess) {
              final data = state.notes.data ?? [];
              return Center(
                child: SizedBox(
                  width: width,
                  height: double.infinity,
                  child: ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return NoteItemView(
                        note: data[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: PaddingDimensions.normal,
                        child: Center(
                          child: Container(
                            color: Colors.grey.shade400,
                            height: 1,
                            width: width/2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}

class NoteItemView extends StatelessWidget {
  final Note note;
  const NoteItemView({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(PaddingDimensions.normal),
      child: Row(
        children: [
          Expanded(
            child: Text(
              note.text,
              style: TextStyles.regular(
                color: AppColors.textPrimaryColor,
                fontSize: Dimensions.normal
              ),
            ),
          ),

          SizedBox(width: PaddingDimensions.normal,),

          IconButton(
            onPressed: () {
              //TODO
            },
            icon: const Icon(
                Icons.edit
            ),
          ),

          SizedBox(width: PaddingDimensions.normal,),

          IconButton(
            onPressed: () {
              //TODO
            },
            icon: const Icon(
                Icons.delete
            ),
          ),
        ],
      ),
    );
  }
}
