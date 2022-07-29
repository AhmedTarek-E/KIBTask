import 'package:kib_task/home/domain/repositories/notes_repository.dart';

class AddNoteUseCase {
  final NotesRepository _repository;

  AddNoteUseCase(this._repository);

  Future<void> execute(String content) {
    return _repository.addNote(content);
  }
}