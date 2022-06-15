import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/routes/app_routes.dart';

import 'package:notes_app/config/themes/app_theme.dart';

import 'package:notes_app/presentation/bloc/notes_bloc.dart';

import 'config/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: Pages.root,
      ),
    );
  }
}
