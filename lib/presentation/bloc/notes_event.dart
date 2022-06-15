part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class NotesCreateEvent extends NotesEvent {}

class NotesShowEvent extends NotesEvent {}
