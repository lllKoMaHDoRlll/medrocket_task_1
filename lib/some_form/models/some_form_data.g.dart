// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SomeFormData _$SomeFormDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SomeFormData',
      json,
      ($checkedConvert) {
        final val = SomeFormData(
          progress: $checkedConvert('progress', (v) => (v as num).toDouble()),
          status: $checkedConvert(
              'status', (v) => $enumDecode(_$SomeFormStatusEnumMap, v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SomeFormDataToJson(SomeFormData instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'status': _$SomeFormStatusEnumMap[instance.status]!,
    };

const _$SomeFormStatusEnumMap = {
  SomeFormStatus.notStarted: 'notStarted',
  SomeFormStatus.inProgress: 'inProgress',
  SomeFormStatus.completed: 'completed',
};
