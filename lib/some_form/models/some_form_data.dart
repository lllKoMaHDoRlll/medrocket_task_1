import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:some_form_repository/some_form_repository.dart';
import 'package:some_form_repository/some_form_repository.dart' as some_form_repository;

part 'some_form_data.g.dart';


@JsonSerializable()
class SomeFormData extends Equatable {
  final double progress;
  final SomeFormStatus status;

  const SomeFormData({
    required this.progress,
    required this.status,
  });

  factory SomeFormData.fromJson(Map<String, dynamic> json) =>
      _$SomeFormDataFromJson(json);

  factory SomeFormData.fromRepository(some_form_repository.SomeFormData someFormData) {
    return SomeFormData(
      progress: someFormData.progress,
      status: someFormData.status,
    );
  }

  static const empty = SomeFormData(
    progress: 0.0,
    status: SomeFormStatus.notStarted,
  );


  @override
  List<Object> get props => [progress, status];

  Map<String, dynamic> toJson() => _$SomeFormDataToJson(this);

  SomeFormData copyWith({
    double? progress,
    SomeFormStatus? status,
  }) {
    return SomeFormData(
      progress: progress ?? this.progress,
      status: status ?? this.status,
    );
  }
}
