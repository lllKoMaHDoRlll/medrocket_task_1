import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medrocket_home_task_1/some_form/models/some_form_data.dart';
import 'package:some_form_repository/some_form_repository.dart' show SomeFormRepository;

part 'some_form_cubit.g.dart';
part 'some_form_state.dart';

class SomeFormCubit extends Cubit<SomeFormState> {
  SomeFormCubit(this._someFormRepository) : super(SomeFormInitial());

  final SomeFormRepository _someFormRepository;

  Future<void> fetchSomeForm() async {
    emit(state.copyWith(status: SomeFormStatus.loading));

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
  }

  SomeFormState fromJson(Map<String, dynamic> json) => SomeFormState.fromJson(json);

  Map<String, dynamic> toJson(SomeFormState state) => state.toJson();
}
