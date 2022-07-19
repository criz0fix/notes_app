part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class CreateNote extends NotesEvent {
  final NoteNavigatorModel navigatorModel;
  CreateNote({required this.navigatorModel});
}

class CompareNotes extends NotesEvent {
  final NoteNavigatorModel navigatorModel;

  CompareNotes({required this.navigatorModel});
}

class FindNote extends NotesEvent {
  final String searchingNote;

  FindNote({required this.searchingNote});
}

class DeleteNote extends NotesEvent {
  final Note delNote;
  DeleteNote({required this.delNote});
}

class ActivateSearchField extends NotesEvent {}

class DeactivateSearchField extends NotesEvent {}

class ChangeStatus extends NotesEvent {
  final NotesStates status;

  ChangeStatus({required this.status});
}

class ChangeFoundList extends NotesEvent {
  final List<Note> foundNotes;

  ChangeFoundList({required this.foundNotes});
}

class UpdateNoteList extends NotesEvent {}
