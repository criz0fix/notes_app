import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/themes/app_color.dart';

import 'package:notes_app/data/models/note.dart';
import 'package:notes_app/presentation/bloc/notes_bloc.dart';
import 'package:notes_app/presentation/cubit/notes_cubit.dart';
import 'package:notes_app/presentation/widgets/custom_button.dart';

class NotePage extends StatelessWidget {
  final Note note;
  const NotePage({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note.title);
    final descriptionController = TextEditingController(text: note.description);
    return BlocProvider(
      create: (_) => NotesCubit(note),
      child: BlocBuilder<NotesCubit, PageNotesState>(
        builder: (context, state) {
          final myCubit = context.read<NotesCubit>();
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 80,
              leading: CustomButton(
                icon: Icons.arrow_back_rounded,
                onPressed: () => Navigator.pop(
                  context,
                  Note(
                      title: myCubit.state.title,
                      description: myCubit.state.description,
                      creationTime: myCubit.state.time),
                ),
              ),
              actions: <Widget>[
                CustomButton(
                    iconSize: 30,
                    icon: Icons.save_outlined,
                    onPressed: () => context.read<NotesCubit>().saveNote()),
                CustomButton(
                  icon: Icons.edit_outlined,
                  onPressed: () => myCubit.changeToEdit(),
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              physics: const BouncingScrollPhysics(),
              children: [
                TextField(
                  onChanged: (value) => myCubit.changeTitle(value),
                  controller: titleController,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.headline3,
                    hintText: 'Title',
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: 4,
                  readOnly: myCubit.state.readOnly,
                ),
                TextField(
                  onChanged: (value) => myCubit.changeDescription(value),
                  controller: descriptionController,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                      hintText: 'Your Note',
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      border: InputBorder.none),
                  expands: false,
                  maxLines: null,
                  minLines: null,
                  readOnly: myCubit.state.readOnly,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
