import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/data/models/note.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState(noteList: [], foundNotes: [])) {
    on<CompareNotes>(_compareNotes);
    on<CreateNote>(_createNote);
    on<DeleteNote>(_deleteNote);
    on<ActivateSearchField>(_activateSearchField);
    on<DeactivateSearchField>(_deactivateSearchfield);
    on<FindNote>(_searchNote);
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

  void _activateSearchField(
          ActivateSearchField event, Emitter<NotesState> emit) =>
      emit(state.copyWith(isSearchActive: true));

  void _deactivateSearchfield(
          DeactivateSearchField event, Emitter<NotesState> emit) =>
      emit(state.copyWith(isSearchActive: false));

  void _searchNote(FindNote event, Emitter<NotesState> emit) {
    log('message');
    emit(state.copyWith(status: NotesStates.searching));
    List<Note> searchingNotes = [];
    for (var note in state.noteList) {
      if (note.title.contains(event.searchingNote) ||
          note.description.contains(event.searchingNote)) {
        searchingNotes.add(note);
      }
    }
    emit(state.copyWith(status: NotesStates.found, foundNotes: searchingNotes));
  }
}
