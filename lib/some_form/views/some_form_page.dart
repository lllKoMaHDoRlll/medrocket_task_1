import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medrocket_home_task_1/some_form/bloc/some_form_bloc.dart';

class SomeFormPage extends StatelessWidget {
  const SomeFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Some Form"),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<SomeFormBloc, SomeFormState>(
            builder: (context, state) {
              return switch (state.status) {
                SomeFormStatus.initial => Text("Try to fetch data with FAB."),
                SomeFormStatus.loading => Text("Loading"),
                SomeFormStatus.failure => Text("Some error occured. Try again."),
                SomeFormStatus.success => Text(
                  textAlign: TextAlign.center,
                  "Status is: ${state.data.status}.\nCompletion: ${state.data.progress}",
                ),
              };
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!context.mounted) return;
          context.read<SomeFormBloc>().add(SomeFormFetchButtonPressed());
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}
