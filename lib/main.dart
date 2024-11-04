import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_myapp/constants.dart';
import 'package:notes_app_myapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_myapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_myapp/models/note_model.dart';
import 'package:notes_app_myapp/simple_bloc_observer.dart';
import 'package:notes_app_myapp/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
