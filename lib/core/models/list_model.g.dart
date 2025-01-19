// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModel<T> _$ListModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListModel<T>(
      (json['code'] as num?)?.toInt(),
      json['message'] as String?,
      (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      json['success'] as bool?,
    );

Map<String, dynamic> _$ListModelToJson<T>(
  ListModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      'data': instance.data?.map(toJsonT).toList(),
    };
