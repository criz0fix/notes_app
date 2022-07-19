part of 'notes_cubit.dart';

class PageNotesState extends Equatable {
  final String title;
  final String description;
  final bool readOnly;
  final bool isSaved;
  final String noteId;

  const PageNotesState(
      {required this.title,
      required this.description,
      required this.readOnly,
      required this.isSaved,
      required this.noteId});
  @override
  List<Object> get props => [title, description, readOnly, isSaved, noteId];
  PageNotesState copywith(
          {String? title,
          String? description,
          bool? readOnly,
          bool? isSaved,
          String? noteId,
          bool? isNew}) =>
      PageNotesState(
          title: title ?? this.title,
          description: description ?? this.description,
          readOnly: readOnly ?? this.readOnly,
          isSaved: isSaved ?? this.isSaved,
          noteId: noteId ?? this.noteId);
}
