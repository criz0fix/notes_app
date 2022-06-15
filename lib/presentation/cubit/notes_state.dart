part of 'notes_cubit.dart';

class NotesState extends Equatable {
  final bool readOnly;
  const NotesState({this.readOnly = false});

  @override
  List<Object> get props => [readOnly];

  NotesState copywith({bool? readOnly}) =>
      NotesState(readOnly: readOnly ?? this.readOnly);
}
