import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/routes/pages.dart';
import 'package:notes_app/config/themes/app_color.dart';
import 'package:notes_app/core/utils/consts.dart';
import 'package:notes_app/data/models/note.dart';
import 'package:notes_app/presentation/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/widgets/common_note_tile.dart';
import 'package:notes_app/presentation/widgets/custom_button.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myBloc = context.read<NotesBloc>();
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => myBloc.add(DeactivateSearchField()),
          child: Scaffold(
              appBar: _ChangeableAppBar(myBloc: myBloc),
              floatingActionButton: FloatingActionButton(
                onPressed: () async => await Navigator.pushNamed(
                        context, Pages.notePage,
                        arguments: {'note': Note.newNote()})
                    .then((newNote) =>
                        myBloc.add(CreateNote(newNote: newNote as Note))),
                child: const Icon(
                  Icons.add_outlined,
                  color: AppColor.white,
                ),
              ),
              body: Builder(
                builder: (context) {
                  if (state.status == NotesStates.inititalized ||
                      state.status == NotesStates.found) {
                    return const _AllNotes();
                  } else {
                    return const Center(
                      child: Text('data'),
                    );
                  }
                },
              )),
        );
      },
    );
  }
}

class _ChangeableAppBar extends StatelessWidget with PreferredSizeWidget {
  final NotesBloc myBloc;

  const _ChangeableAppBar({Key? key, required this.myBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return myBloc.state.isSearchActive
        ? AppBar(
            title: SizedBox(
              height: 50,
              child: TextField(
                autofocus: true,
                controller: searchController,
                style: Theme.of(context).textTheme.bodyText2,
                onChanged: (text) =>
                    myBloc..add(FindNote(searchingNote: searchController.text)),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close_rounded, color: AppColor.grey),
                    splashColor: Colors.transparent,
                    onPressed: () => searchController.clear(),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(38, 11, 0, 12),
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  hintText: 'Search by the keyword...',
                  filled: true,
                  fillColor: AppColor.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          )
        : AppBar(
            actions: <Widget>[
              CustomButton(
                icon: Icons.search,
                /*add textfield*/
                onPressed: () => myBloc.add(ActivateSearchField()),
              ),
            ],
            title: const Text(appTitle),
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarToolbarHeight);
}

class _AllNotes extends StatelessWidget {
  const _AllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myBloc = context.read<NotesBloc>();
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.status == NotesStates.inititalized
              ? state.noteList.length
              : state.foundNotes.length,
          itemBuilder: ((context, index) {
            final item = state.status == NotesStates.inititalized
                ? state.noteList[index]
                : state.foundNotes[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  myBloc.add(DeleteNote(index: index));
                }
              },
              child: GestureDetector(
                onTap: () async => await Navigator.pushNamed(
                    context, Pages.notePage, arguments: {
                  'note': item
                }).then((editedNote) => myBloc.add(
                    CompareNotes(newNote: editedNote as Note, index: index))),
                child: CommonNoteTile(
                  noteTitle: item.title,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _SearchingNotes extends StatelessWidget {
  const _SearchingNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('searching'),
    );
  }
}
