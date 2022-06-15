import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String bodyText;
  final DateTime creationTime;

  const Note(
      {required this.title,
      required this.bodyText,
      required this.creationTime});

  @override
  List<Object?> get props => [title, bodyText, creationTime];
}
