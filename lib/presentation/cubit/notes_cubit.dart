import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/data/models/note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<PageNotesState> {
  NotesCubit(Note myNote)
      : super(PageNotesState(
            title: myNote.title,
            description: myNote.description,
            time: myNote.creationTime));

  void changeToEdit() => emit(state.copywith(readOnly: !state.readOnly));

  void changeTitle(String newTitle) => emit(state.copywith(title: newTitle));

  void changeDescription(String newDescription) =>
      emit(state.copywith(description: newDescription));

  bool validated() {
    return true;
  }

  void saveNote() => emit(state.copywith(time: DateTime.now()));
}
