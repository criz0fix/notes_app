part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class CreateNote extends NotesEvent {
  final Note newNote;

  CreateNote({required this.newNote});
}

class CompareNotes extends NotesEvent {
  final Note newNote;
  final int index;

  CompareNotes({required this.newNote, required this.index});
}

class FindNote extends NotesEvent {
  final String searchingNote;

  FindNote({required this.searchingNote});
}

class DeleteNote extends NotesEvent {
  final int index;

  DeleteNote({required this.index});
}
