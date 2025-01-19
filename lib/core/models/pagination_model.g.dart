// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel<T> _$PaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationModel<T>(
      json['data'] == null
          ? null
          : PaginationTData<T>.fromJson(json['data'] as Map<String, dynamic>,
              (value) => fromJsonT(value)),
      (json['code'] as num?)?.toInt(),
      json['message'] as String?,
      json['success'] as bool?,
    );

Map<String, dynamic> _$PaginationModelToJson<T>(
  PaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.toJson(
        (value) => toJsonT(value),
      ),
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
    };

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) =>
    PaginationData(
      json['per_page'],
      json['current_page'],
      json['total_pages'],
    );

Map<String, dynamic> _$PaginationDataToJson(PaginationData instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };

PaginationTData<T> _$PaginationTDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationTData<T>(
      (json['list'] as List<dynamic>?)?.map(fromJsonT).toList(),
      json['pagination'] == null
          ? null
          : PaginationData.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationTDataToJson<T>(
  PaginationTData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'list': instance.list?.map(toJsonT).toList(),
      'pagination': instance.pagination?.toJson(),
    };
