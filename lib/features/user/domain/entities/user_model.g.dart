// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['status'] as String?,
      json['message'] as String?,
      json['status_code'],
      json['data'] == null
          ? null
          : NewUserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.data?.toJson(),
    };

NewUserData _$NewUserDataFromJson(Map<String, dynamic> json) => NewUserData(
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['point'] as num?,
      json['type'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$NewUserDataToJson(NewUserData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'avatar': instance.avatar,
      'point': instance.point,
    };
