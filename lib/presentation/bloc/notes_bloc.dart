import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/data/local/database.dart';
import 'package:notes_app/data/models/note.dart';
import 'package:notes_app/data/models/note_navigator_model.dart';

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
    on<ChangeStatus>(_changeStatus);
    on<ChangeFoundList>(_changeFoundList);
    on<UpdateNoteList>(_updateNoteList);
  }

  Future<void> _compareNotes(
      CompareNotes event, Emitter<NotesState> emit) async {
    if (_isFieldsNotEmpty(event.navigatorModel.note) &&
        event.navigatorModel.isSaved) {
      // await NProvider.db.deleteNote(event.navigatorModel.note.noteId);
      // await NProvider.db.insertNote(event.navigatorModel.note);
      await NProvider.db.updateNote(
          event.navigatorModel.note.noteId, event.navigatorModel.note);
      emit(state.copyWith(
          noteList: [...state.noteList]
            ..removeWhere(
                (note) => note.noteId == event.navigatorModel.note.noteId)
            ..insert(0, event.navigatorModel.note)));
      emit(state.copyWith(
          foundNotes: [...state.foundNotes]
            ..removeWhere(
                (note) => note.noteId == event.navigatorModel.note.noteId)
            ..insert(0, event.navigatorModel.note)));
    }
  }

  Future<void> _createNote(CreateNote event, Emitter<NotesState> emit) async {
    if (_isFieldsNotEmpty(event.navigatorModel.note) &&
        event.navigatorModel.isSaved) {
      emit(state.copyWith(
          noteList: [...state.noteList]..insert(0, event.navigatorModel.note)));
      await NProvider.db.insertNote(event.navigatorModel.note);
    }
  }

  bool _isFieldsNotEmpty(Note note) =>
      note.title.isNotEmpty || note.description.isNotEmpty;

  Future<void> _deleteNote(DeleteNote event, Emitter<NotesState> emit) async {
    await NProvider.db.deleteNote(event.delNote.noteId);
    emit(state.copyWith(
        noteList: [...state.noteList]
          ..removeWhere((note) => note.noteId == event.delNote.noteId)));
  }

  void _activateSearchField(
          ActivateSearchField event, Emitter<NotesState> emit) =>
      emit(state.copyWith(isSearchActive: true));

  void _deactivateSearchfield(
          DeactivateSearchField event, Emitter<NotesState> emit) =>
      emit(state.copyWith(
          isSearchActive: false, status: NotesStates.inititalized));

  void _searchNote(FindNote event, Emitter<NotesState> emit) {
    emit(state.copyWith(status: NotesStates.searching));
    List<Note> searchingNotes = [];
    if (event.searchingNote.isEmpty) {
      emit(state.copyWith(status: NotesStates.inititalized));
    } else {
      searchingNotes = state.noteList
          .where((note) =>
              note.description.contains(event.searchingNote) ||
              note.title.contains(event.searchingNote))
          .toList();
      if (searchingNotes.isNotEmpty) {
        emit(state.copyWith(status: NotesStates.found));
      } else {
        emit(state.copyWith(status: NotesStates.notFound));
      }

      if (state.status == NotesStates.found) {
        emit(state.copyWith(
            status: NotesStates.found, foundNotes: searchingNotes));
      } else if (state.status == NotesStates.notFound) {}
    }
  }

  void _changeStatus(ChangeStatus event, Emitter<NotesState> emit) =>
      emit(state.copyWith(status: event.status));

  void _changeFoundList(ChangeFoundList event, Emitter<NotesState> emit) =>
      emit(state.copyWith(foundNotes: event.foundNotes));

  Future<void> _updateNoteList(
      UpdateNoteList event, Emitter<NotesState> emit) async {
    final list = await NProvider.db.getNotes();
    emit(state.copyWith(noteList: list));
  }
}
