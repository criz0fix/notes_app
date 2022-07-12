part of 'notes_cubit.dart';

class PageNotesState extends Equatable {
  final String title;
  final String description;
  final bool readOnly;
  final bool isSaved;

  const PageNotesState(
      {required this.title,
      required this.description,
      required this.readOnly,
      required this.isSaved});

  @override
  List<Object> get props => [title, description, readOnly, isSaved];
  PageNotesState copywith(
          {String? title,
          String? description,
          bool? readOnly,
          bool? isSaved,
          int? noteId}) =>
      PageNotesState(
          title: title ?? this.title,
          description: description ?? this.description,
          readOnly: readOnly ?? this.readOnly,
          isSaved: isSaved ?? this.isSaved);
}
