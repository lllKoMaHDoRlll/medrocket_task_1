import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medrocket_home_task_1/some_form/cubit/some_form_cubit.dart';
import 'package:medrocket_home_task_1/some_form/views/some_form_page.dart';
import 'package:some_form_repository/some_form_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => SomeFormRepository(),
      dispose: (repository) => repository.dispose(),
      child: BlocProvider(
        create: (context) => SomeFormCubit(context.read<SomeFormRepository>()),
        child: const MainAppView(),
      ),
    );
  }
}

class MainAppView extends StatelessWidget {
  const MainAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SomeFormPage(),
    );
  }
}
