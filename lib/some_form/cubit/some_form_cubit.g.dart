// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'some_form_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SomeFormState _$SomeFormStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SomeFormState',
      json,
      ($checkedConvert) {
        final val = SomeFormState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$SomeFormStatusEnumMap, v) ??
                  SomeFormStatus.initial),
          data: $checkedConvert(
              'data',
              (v) => v == null
                  ? null
                  : SomeFormData.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SomeFormStateToJson(SomeFormState instance) =>
    <String, dynamic>{
      'status': _$SomeFormStatusEnumMap[instance.status]!,
      'data': instance.data.toJson(),
    };

const _$SomeFormStatusEnumMap = {
  SomeFormStatus.initial: 'initial',
  SomeFormStatus.loading: 'loading',
  SomeFormStatus.success: 'success',
  SomeFormStatus.failure: 'failure',
};
