import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState()) {
    // on<NotesEvent>((NotesShowEvent, emit) {
    //   // TODO: implement event handler
    // });
    on<NotesShowEvent>(_showNote);
    on<NotesCreateEvent>(_createNote);
  }

  void _showNote(NotesShowEvent event, Emitter<NotesState> emit) => {};

  void _createNote(NotesCreateEvent event, Emitter<NotesState> emit) => {};
}
