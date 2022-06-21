import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/routes/pages.dart';
import 'package:notes_app/config/themes/app_color.dart';
import 'package:notes_app/core/utils/consts.dart';
import 'package:notes_app/data/models/note.dart';
import 'package:notes_app/presentation/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/views/note_page.dart';
import 'package:notes_app/presentation/widgets/common_note_tile.dart';
import 'package:notes_app/presentation/widgets/custom_button.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myBloc = context.read<NotesBloc>();
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              CustomButton(
                icon: Icons.search,
                onPressed: () {},
              ),
            ],
            title: const Text(appTitle),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => await Navigator.pushNamed(
                context, Pages.notePage, arguments: {
              'note': Note.newNote()
            }).then(
                (newNote) => myBloc.add(CreateNote(newNote: newNote as Note))),
            child: const Icon(
              Icons.add_outlined,
              color: AppColor.white,
            ),
          ),
          body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.noteList.length,
              itemBuilder: ((context, index) {
                final item = state.noteList[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      myBloc.add(DeleteNote(index: index));
                    }
                  },
                  child: GestureDetector(
                    onTap: () async => await Navigator.pushNamed(
                            context, Pages.notePage, arguments: {'note': item})
                        .then((editedNote) => myBloc.add(CompareNotes(
                            newNote: editedNote as Note, index: index))),
                    child: CommonNoteTile(
                      noteTitle: item.title,
                    ),
                  ),
                );
              })),
        );
      },
    );
  }
}
