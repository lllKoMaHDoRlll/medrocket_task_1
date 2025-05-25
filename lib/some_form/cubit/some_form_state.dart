part of 'some_form_cubit.dart';

enum SomeFormStatus {
  initial,
  loading,
  success,
  failure,
}

extension SomeFormStatusX on SomeFormStatus {
  bool get isInitial => this == SomeFormStatus.initial;
  bool get isLoading => this == SomeFormStatus.loading;
  bool get isSuccess => this == SomeFormStatus.success;
  bool get isFailure => this == SomeFormStatus.failure;
}

@JsonSerializable()
final class SomeFormState extends Equatable {
  final SomeFormStatus status;
  final SomeFormData data;

  const SomeFormState({
    this.status = SomeFormStatus.initial,
    SomeFormData? data
  }) : data = data ?? SomeFormData.empty;

  factory SomeFormState.fromJson(Map<String, dynamic> json) =>
    _$SomeFormStateFromJson(json);

  SomeFormState copyWith({
    SomeFormStatus? status,
    SomeFormData? data,
  }) {
    return SomeFormState(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() => _$SomeFormStateToJson(this);

  @override
  List<Object> get props => [status, data];
}

final class SomeFormInitial extends SomeFormState {}
