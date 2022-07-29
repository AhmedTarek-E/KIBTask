import 'package:kib_task/home/domain/models/note.dart';

abstract class NotesRepository {
  Stream<List<Note>> subscribeToNotes();
  Future<void> addNote(String content);
  Future<void> removeNote(String id);
  Future<void> updateNote(Note updatedNote);
}