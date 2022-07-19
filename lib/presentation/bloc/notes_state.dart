part of 'notes_bloc.dart';

enum NotesStates { inititalized, searching, found, notFound }

class NotesState extends Equatable {
  final List<Note> noteList;
  final NotesStates status;
  final bool isEmpty;
  final String? title;
  final String? description;
  final List<Note> foundNotes;
  final bool isSearchActive;

  const NotesState(
      {required this.noteList,
      required this.foundNotes,
      this.status = NotesStates.inititalized,
      this.isEmpty = false,
      this.title,
      this.description,
      this.isSearchActive = false});

  @override
  List<Object> get props {
    return [noteList, status, isEmpty, isSearchActive, foundNotes];
  }

  NotesState copyWith(
      {List<Note>? noteList,
      List<Note>? foundNotes,
      NotesStates? status,
      bool? isEmpty,
      String? title,
      String? description,
      bool? isSearchActive}) {
    return NotesState(
        noteList: noteList ?? this.noteList,
        foundNotes: foundNotes ?? this.foundNotes,
        status: status ?? this.status,
        isEmpty: isEmpty ?? this.isEmpty,
        title: title ?? this.title,
        description: description ?? this.description,
        isSearchActive: isSearchActive ?? this.isSearchActive);
  }
}
