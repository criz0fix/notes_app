part of 'notes_bloc.dart';

class NotesState extends Equatable {
  //final int notesQuantity;
  final bool isEmpty;
  final String? title;
  final String? description;

  const NotesState({this.isEmpty = false, this.title, this.description});

  @override
  List<Object?> get props => [isEmpty];

  NotesState copyWith({
    bool? isEmpty,
  }) {
    return NotesState(
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
