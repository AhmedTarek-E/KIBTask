import 'package:kib_task/home/domain/repositories/notes_repository.dart';

class RemoveNoteUseCase {
  final NotesRepository _repository;

  RemoveNoteUseCase(this._repository);

  Future<void> execute(String id) {
    return _repository.removeNote(id);
  }
}