import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/routes/pages.dart';
import 'package:notes_app/config/themes/app_color.dart';
import 'package:notes_app/core/utils/consts.dart';
import 'package:notes_app/data/models/note.dart';
import 'package:notes_app/data/models/note_navigator_model.dart';
import 'package:notes_app/presentation/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/cubit/notes_cubit.dart';
import 'package:notes_app/presentation/widgets/common_note_tile.dart';
import 'package:notes_app/presentation/widgets/custom_button.dart';
import 'package:notes_app/presentation/widgets/delete_background.dart';

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
                    context, Pages.notePage, arguments: {
                  'note': Note.newNote()
                }).then((newNote) => myBloc.add(
                    CreateNote(navigatorModel: newNote as NoteNavigatorModel))),
                child: const Icon(
                  Icons.add_outlined,
                  color: AppColor.white,
                ),
              ),
              body: Builder(
                builder: (context) {
                  if (state.status == NotesStates.inititalized ||
                      state.status == NotesStates.found) {
                    return _AllNotes();
                  } else {
                    return _NotFoundPage();
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
  static final searchController = TextEditingController();

  const _ChangeableAppBar({Key? key, required this.myBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myBloc.state.isSearchActive
        ? AppBar(
            title: SizedBox(
              height: 50,
              child: TextField(
                autofocus: true,
                controller: searchController,
                style: Theme.of(context).textTheme.bodyText2,
                onChanged: (text) {
                  myBloc.add(FindNote(searchingNote: text));
                  //myBloc.add(ChangeStatus(status: NotesStates.searching));
                  // myBloc
                  //   ..add(ChangeStatus(status: NotesStates.found))
                  //   ..add(ChangeFoundList(foundNotes: searchingNotes));
                },
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
  _AllNotes({Key? key}) : super(key: key);

  AlignmentDirectional? directioning;
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
              background: const DeleteBackGround(),
              onDismissed: (direction) {
                myBloc.add(DeleteNote(index: index));
              },
              child: GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(context, Pages.notePage,
                      arguments: {'note': item}).then((editedNote) {
                    // final myNoteList = editedNote as List;
                    myBloc.add(
                      CompareNotes(
                          navigatorModel: editedNote as NoteNavigatorModel,
                          index: myBloc.state.noteList.indexOf(item)),
                    );
                  });
                  log(index.toString());
                },
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

class _NotFoundPage extends StatelessWidget {
  const _NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/not-found.png'));
  }
}
