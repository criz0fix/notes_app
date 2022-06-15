import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesState());

  void changeToEdit() => emit(state.copywith(readOnly: !state.readOnly));
}
