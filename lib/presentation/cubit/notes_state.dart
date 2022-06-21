part of 'notes_cubit.dart';

class PageNotesState extends Equatable {
  final String title;
  final String description;
  final DateTime time;
  final bool readOnly;

  const PageNotesState(
      {required this.title,
      required this.description,
      required this.time,
      this.readOnly = false});

  @override
  List<Object> get props => [title, description, time, readOnly];
  PageNotesState copywith(
          {String? title,
          String? description,
          DateTime? time,
          bool? readOnly}) =>
      PageNotesState(
          title: title ?? this.title,
          description: description ?? this.description,
          time: time ?? this.time,
          readOnly: readOnly ?? this.readOnly);
}
