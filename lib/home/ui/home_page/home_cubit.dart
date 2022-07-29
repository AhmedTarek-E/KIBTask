import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_task/home/domain/use_cases/add_note_use_case.dart';
import 'package:kib_task/home/domain/use_cases/notes_use_case.dart';
import 'package:kib_task/home/domain/use_cases/remove_note_use_case.dart';
import 'package:kib_task/home/domain/use_cases/update_note_use_case.dart';
import 'package:kib_task/utils/async.dart';
import 'package:rxdart/rxdart.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NotesUseCase _notesUseCase;
  final RemoveNoteUseCase _removeNoteUseCase;

  final composite = CompositeSubscription();

  HomeCubit(
    this._notesUseCase,
    this._removeNoteUseCase,
  ) : super(const HomeState.initial());

  void onStarted() {
    emit(state.reduce(notes: const Async.loading()));

    composite.add(
      _notesUseCase.execute().listen((event) {
        emit(state.reduce(notes: Async.success(event)));
      })..onError((error) {
        emit(state.reduce(
          notes: const Async.failure("error")
        ));
      })
    );
  }

  void removeNote(String id) async {
    emit(state.reduce(removeNote: const Async.loading()));
    try {
      await _removeNoteUseCase.execute(id);
      emit(state.reduce(removeNote: const Async.successWithoutData()));
    } catch (e) {
      emit(state.reduce(
        errorMessage: "Failed to remove",
        removeNote: const Async.failure("error")),
      );
    }
  }

  @override
  Future<void> close() {
    composite.clear();
    return super.close();
  }
}