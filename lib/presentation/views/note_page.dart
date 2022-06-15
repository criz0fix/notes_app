import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/core/utils/consts.dart';
import 'package:notes_app/presentation/cubit/notes_cubit.dart';
import 'package:notes_app/presentation/widgets/custom_button.dart';

class NotePage extends StatelessWidget {
  final String? title;
  final String? description;
  const NotePage({Key? key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: title);
    final descriptionController = TextEditingController(text: description);
    return BlocProvider(
      create: (_) => NotesCubit(),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          final myCubit = context.read<NotesCubit>();
          return Scaffold(
              appBar: AppBar(
                leadingWidth: 80,
                leading: CustomButton(
                  icon: Icons.arrow_back_rounded,
                  onPressed: () => Navigator.pop(context),
                ),
                actions: <Widget>[
                  CustomButton(
                    iconSize: 30,
                    icon: Icons.save_outlined,
                    onPressed: () => {},
                  ),
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
              )
              // body: ListView(children: [
              //   Column(
              //     children: [
              //       TextField(
              //         controller: titleController,
              //         style: Theme.of(context).textTheme.headline4,
              //         textAlign: TextAlign.left,
              //         decoration: InputDecoration(
              //           hintStyle: Theme.of(context).textTheme.headline3,
              //           hintText: 'Title',
              //           border: InputBorder.none,
              //         ),
              //         minLines: 1,
              //         maxLines: 4,
              //         readOnly: true,
              //       ),
              //       TextField(
              //         controller: descriptionController,
              //         style: Theme.of(context).textTheme.bodyText1,
              //         decoration: InputDecoration(
              //             hintText: 'Your Note',
              //             hintStyle: Theme.of(context).textTheme.bodyText1,
              //             border: InputBorder.none),
              //         expands: true,
              //         maxLines: null,
              //         minLines: null,
              //         readOnly: false,
              //       ),
              //     ],
              //   ),
              // ]),
              );
        },
      ),
    );
  }
}
