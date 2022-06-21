import 'package:flutter/material.dart';
import 'package:notes_app/config/routes/pages.dart';
import 'package:notes_app/presentation/views/note_page.dart';
import 'package:notes_app/presentation/views/notes_list.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case Pages.root:
        return _materialRoute(view: const NotesList());
      case Pages.notePage:
        return _materialRoute(
          view: NotePage(note: args?['note']),
        );
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(
          {required Widget view, RouteSettings? settings}) =>
      MaterialPageRoute(builder: (_) => view, settings: settings);
}
