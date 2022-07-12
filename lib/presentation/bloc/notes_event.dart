part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class CreateNote extends NotesEvent {
  final NoteNavigatorModel navigatorModel;

  CreateNote({required this.navigatorModel});
}

class CompareNotes extends NotesEvent {
  final NoteNavigatorModel navigatorModel;
  final int index;

  CompareNotes({required this.navigatorModel, required this.index});
}

class FindNote extends NotesEvent {
  final String searchingNote;

  FindNote({required this.searchingNote});
}

class DeleteNote extends NotesEvent {
  final int index;

  DeleteNote({required this.index});
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
