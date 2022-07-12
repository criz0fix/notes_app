import 'package:notes_app/data/models/note.dart';

class NoteModel extends Note {
  const NoteModel({required String title, required String description})
      : super(title: title, description: description);
}
