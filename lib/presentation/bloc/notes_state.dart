// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'notes_bloc.dart';

enum NotesStates { inititalized, searching, found, notFound }

class NotesState extends Equatable {
  //final int notesQuantity;
  final List<Note> noteList;
  final NotesStates status;
  final bool isEmpty;
  final String? title;
  final String? description;

  const NotesState({
    required this.noteList,
    this.status = NotesStates.inititalized,
    this.isEmpty = false,
    this.title,
    this.description,
  });

  @override
  List<Object> get props {
    return [noteList, status, isEmpty];
  }

  NotesState copyWith({
    List<Note>? noteList,
    NotesStates? status,
    bool? isEmpty,
    String? title,
    String? description,
  }) {
    return NotesState(
      noteList: noteList ?? this.noteList,
      status: status ?? this.status,
      isEmpty: isEmpty ?? this.isEmpty,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
