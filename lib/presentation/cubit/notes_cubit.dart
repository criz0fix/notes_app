import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/data/models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<PageNotesState> {
  NotesCubit(Note myNote)
      : super(PageNotesState(
            title: myNote.title,
            description: myNote.description,
            readOnly: false,
            isSaved: false,
            noteId: myNote.noteId));

  void changeToEdit() => emit(state.copywith(readOnly: !state.readOnly));

  void changeTitle(String newTitle) => emit(state.copywith(title: newTitle));

  void changeDescription(String newDescription) =>
      emit(state.copywith(description: newDescription));

  void saveNote() => emit(state.copywith(isSaved: true));

  void createNote() => emit(state.copywith(isNew: true));

  void resetSave() => emit(state.copywith(isSaved: false, isNew: false));
}
