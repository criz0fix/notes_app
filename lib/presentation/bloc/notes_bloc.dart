import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/data/models/note.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState(noteList: [])) {
    on<CompareNotes>(_compareNotes);
    on<CreateNote>(_createNote);
    on<DeleteNote>(_deleteNote);
  }

  void _compareNotes(CompareNotes event, Emitter<NotesState> emit) {
    if (state.noteList[event.index].creationTime
            .compareTo(event.newNote.creationTime) !=
        0) {
      emit(state.copyWith(
          noteList: [...state.noteList]
            ..removeAt(event.index)
            ..insert(0, event.newNote)));
    }
  }

  void _createNote(CreateNote event, Emitter<NotesState> emit) {
    emit(state.copyWith(
        noteList: [...state.noteList]..insert(0, event.newNote)));
  }

  void _deleteNote(DeleteNote event, Emitter<NotesState> emit) {
    emit(state.copyWith(noteList: [...state.noteList]..removeAt(event.index)));
  }
}
