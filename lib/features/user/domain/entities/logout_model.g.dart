// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutModel _$LogoutModelFromJson(Map<String, dynamic> json) => LogoutModel(
      json['status'] as String?,
      json['message'] as String?,
      json['status_code'],
      json['logout'],
    );

Map<String, dynamic> _$LogoutModelToJson(LogoutModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.statusCode,
      'logout': instance.logout,
    };
