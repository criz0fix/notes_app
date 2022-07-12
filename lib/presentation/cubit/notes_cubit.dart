import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/data/models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<PageNotesState> {
  NotesCubit(Note myNote)
      : super(PageNotesState(
            title: myNote.title,
            description: myNote.description,
            readOnly: false,
            isSaved: false));

  void changeToEdit() => emit(state.copywith(readOnly: !state.readOnly));

  void changeTitle(String newTitle) => emit(state.copywith(title: newTitle));

  void changeDescription(String newDescription) =>
      emit(state.copywith(description: newDescription));

  void saveNote() => emit(state.copywith(noteId: 0, isSaved: true));

  void resetSave() => emit(state.copywith(isSaved: false));
}
