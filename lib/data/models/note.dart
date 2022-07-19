import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String description;
  final String noteId;

  const Note(
      {required this.title, required this.description, required this.noteId});

  @override
  List<Object?> get props => [title, description, noteId];

  static Note newNote() =>
      Note(title: '', description: '', noteId: DateTime.now().toString());

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': title,
        'description': description,
        'id': noteId
      };

  factory Note.fromMap(Map<String, dynamic> map) => Note(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      noteId: map['id']);
}
