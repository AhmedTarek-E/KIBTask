import 'package:firebase_database/firebase_database.dart';
import 'package:kib_task/home/domain/models/note.dart';
import 'package:kib_task/home/domain/repositories/notes_repository.dart';
import 'package:kib_task/utils/common.dart';
import 'package:kib_task/utils/extensions.dart';

class NotesRepositoryImp implements NotesRepository {
  final FirebaseDatabase database;

  NotesRepositoryImp(this.database);

  @override
  Future<void> addNote(String content) async {
    final id = getRandomString(16);
    final ref = database.ref("notes/$id");

    await ref.set(content);
  }

  @override
  Future<void> removeNote(String id) async {
    final ref = database.ref("notes/$id");
    await ref.remove();
  }

  @override
  Stream<List<Note>> subscribeToNotes() {
    final ref = database.ref("notes");
    return ref.onValue.map((event) {
      final values = event.snapshot.children.toList();
      return values.mapNotNull((e) {
        final id = e.key;
        if (id == null) {
          return null;
        } else {
          return Note(id, e.value as String? ?? "");
        }
      }).toList();
    });
  }

  @override
  Future<void> updateNote(Note updatedNote) async {
    final ref = database.ref("notes/${updatedNote.id}");
    await ref.set(updatedNote.text);
  }
}