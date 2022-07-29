import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  //TODO define your use cases

  HomeCubit() : super(const HomeState.initial());

  void onStarted() async {
    //TODO load notes
  }

  void removeNote(String id) async {
    //TODO remove note
  }
}