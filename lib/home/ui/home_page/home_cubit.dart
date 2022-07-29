import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_task/home/domain/models/note.dart';
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
  final AddNoteUseCase _addNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;

  final composite = CompositeSubscription();

  HomeCubit(
    this._notesUseCase,
    this._removeNoteUseCase,
    this._addNoteUseCase,
    this._updateNoteUseCase,
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

  void addNote(String content) async {
    emit(state.reduce(addNote: const Async.loading()));
    try {
      await _addNoteUseCase.execute(content);
      emit(state.reduce(addNote: const Async.successWithoutData()));
    } catch (e) {
      emit(state.reduce(
          errorMessage: "Failed to add",
          addNote: const Async.failure("error")),
      );
    }
  }

  void editNote(Note updatedNote) async {
    emit(state.reduce(updateNote: const Async.loading()));
    try {
      await _updateNoteUseCase.execute(updatedNote);
      emit(state.reduce(updateNote: const Async.successWithoutData()));
    } catch (e) {
      emit(state.reduce(
          errorMessage: "Failed to add",
          updateNote: const Async.failure("error")),
      );
    }
  }

  @override
  Future<void> close() {
    composite.clear();
    return super.close();
  }


}