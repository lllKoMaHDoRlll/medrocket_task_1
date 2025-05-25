import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'some_form_data.g.dart';

enum SomeFormStatus {
  notStarted,
  inProgress,
  completed,
}

@JsonSerializable()
class SomeFormData extends Equatable {
  final double progress;
  final SomeFormStatus status;

  const SomeFormData({
    required this.progress,
    required this.status
  });

  factory SomeFormData.fromJson(Map<String, dynamic> json) =>
    _$SomeFormDataFromJson(json);

  Map<String, dynamic> toJson() => _$SomeFormDataToJson(this);

  @override
  List<Object?> get props => [progress, status];
}
