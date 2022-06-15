import 'package:notes_app/data/models/note.dart';

class NoteModel extends Note {
  const NoteModel(
      {required String title,
      required String bodyText,
      required DateTime creationTime})
      : super(title: title, bodyText: bodyText, creationTime: creationTime);
}
