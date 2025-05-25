
import 'package:json_annotation/json_annotation.dart';

part 'some_form_data.g.dart';

@JsonSerializable()
class SomeFormData {
  final double progress;

  const SomeFormData({
    required this.progress,
  });

  factory SomeFormData.fromJson(Map<String, dynamic> json) =>
    _$SomeFormDataFromJson(json);
}
