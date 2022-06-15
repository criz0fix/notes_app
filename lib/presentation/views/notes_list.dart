import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/routes/pages.dart';
import 'package:notes_app/config/themes/app_color.dart';
import 'package:notes_app/core/utils/consts.dart';
import 'package:notes_app/presentation/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/views/note_page.dart';
import 'package:notes_app/presentation/widgets/common_note_tile.dart';
import 'package:notes_app/presentation/widgets/custom_button.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.pushNamed(context, Pages.notePage);
            },
            child: const Icon(
              Icons.add_outlined,
              color: AppColor.white,
            ),
          ),
          body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Pages.notePage, arguments: {
                    'title': testTitle,
                    'description': testDescription,
                  }),
                  child: const CommonNoteTile(),
                );
              })),
        );
      },
    );
  }
}

// Scaffold(

//           body: NotePage(),
//         ),
