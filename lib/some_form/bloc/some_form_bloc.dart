import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:medrocket_home_task_1/some_form/models/some_form_data.dart';
import 'package:some_form_repository/some_form_repository.dart' show SomeFormRepository;

part 'some_form_bloc.g.dart';
part 'some_form_state.dart';

sealed class SomeFormEvent {}

final class SomeFormFetchButtonPressed extends SomeFormEvent {}

final class SomeFormFetchRequest extends SomeFormEvent {}

class SomeFormBloc extends Bloc<SomeFormEvent, SomeFormState> {
  final SomeFormRepository _someFormRepository;
  SomeFormBloc(this._someFormRepository) : super(SomeFormInitial()){

    on<SomeFormFetchButtonPressed>(
      (event, emit) {
        emit(state.copyWith(status: SomeFormStatus.loading));
        add(SomeFormFetchRequest());
      },
    );

    on<SomeFormFetchRequest>(
      (event, emit) async {
        try {
          final someFormData = SomeFormData.fromRepository(
            await _someFormRepository.getSomeFormData(),
          );

          emit(
            state.copyWith(
              status: SomeFormStatus.success,
              data: someFormData
            ),
          );
        } on Exception {
          emit(state.copyWith(status: SomeFormStatus.failure));
        }
      },
      transformer: (events, mapper) {
        return events.debounceTime(Duration(milliseconds: 300)).switchMap(mapper);
      }
    );
  }

  SomeFormState fromJson(Map<String, dynamic> json) => SomeFormState.fromJson(json);

  Map<String, dynamic> toJson(SomeFormState state) => state.toJson();
}
