import 'package:equatable/equatable.dart';
import 'package:kib_task/home/domain/models/note.dart';
import 'package:kib_task/utils/async.dart';

class HomeState extends Equatable {
  final String? errorMessage;
  final Async<List<Note>> notes;
  final Async<void> addNote;
  final Async<void> removeNote;
  final Async<void> updateNote;

  const HomeState(
    this.errorMessage,
    this.notes,
    this.addNote,
    this.removeNote,
    this.updateNote,
  );

  const HomeState.initial() : this(
    null,
    const Async.initial(),
    const Async.initial(),
    const Async.initial(),
    const Async.initial(),
  );

  HomeState reduce({
    String? errorMessage,
    Async<List<Note>>? notes,
    Async<void>? addNote,
    Async<void>? removeNote,
    Async<void>? updateNote,
  }) {
    return HomeState(
      errorMessage,
      notes ?? this.notes,
      addNote ?? this.addNote,
      removeNote ?? this.removeNote,
      updateNote ?? this.updateNote,
    );
  }

  @override
  List<Object?> get props => [
    errorMessage,
    notes,
    addNote,
    removeNote,
    updateNote,
  ];
}
