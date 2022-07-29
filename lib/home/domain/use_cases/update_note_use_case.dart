import 'package:kib_task/home/domain/models/note.dart';
import 'package:kib_task/home/domain/repositories/notes_repository.dart';

class UpdateNoteUseCase {
  final NotesRepository _repository;

  UpdateNoteUseCase(this._repository);

  Future<void> execute(Note note) {
    return _repository.updateNote(note);
  }
}