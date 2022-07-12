import 'package:equatable/equatable.dart';
import 'package:notes_app/data/models/note.dart';

class NoteNavigatorModel extends Equatable {
  final Note note;
  final bool isSaved;

  const NoteNavigatorModel({required this.note, required this.isSaved});

  @override
  List<Object?> get props => [note, isSaved];
}
