import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String description;
  final DateTime creationTime;

  const Note(
      {required this.title,
      required this.description,
      required this.creationTime});

  @override
  List<Object?> get props => [title, description, creationTime];

  static Note newNote() =>
      Note(title: '', description: '', creationTime: DateTime.now());
}
