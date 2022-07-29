import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:kib_task/home/data/notes_repository_imp.dart';
import 'package:kib_task/home/domain/repositories/notes_repository.dart';
import 'package:kib_task/home/domain/use_cases/add_note_use_case.dart';
import 'package:kib_task/home/domain/use_cases/notes_use_case.dart';
import 'package:kib_task/home/domain/use_cases/remove_note_use_case.dart';
import 'package:kib_task/home/domain/use_cases/update_note_use_case.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton<NotesRepository>(
          () => NotesRepositoryImp(
              FirebaseDatabase.instance
                  ..databaseURL = "https://kibtask-default-rtdb.europe-west1.firebasedatabase.app"
          ));


  injector.registerFactory(() => NotesUseCase(injector()));
  injector.registerFactory(() => AddNoteUseCase(injector()));
  injector.registerFactory(() => RemoveNoteUseCase(injector()));
  injector.registerFactory(() => UpdateNoteUseCase(injector()));
}