import 'package:kib_task/home/domain/models/note.dart';
import 'package:kib_task/home/domain/repositories/notes_repository.dart';

class NotesUseCase {
  final NotesRepository _repository;

  NotesUseCase(this._repository);

  Stream<List<Note>> execute() {
    return _repository.subscribeToNotes();
  }
}