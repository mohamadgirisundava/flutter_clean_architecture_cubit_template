import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserModel extends Equatable {
  final String? status, message;
  final dynamic statusCode;
  final NewUserData? data;

  const UserModel(
    this.status,
    this.message,
    this.statusCode,
    this.data,
  );
  @override
  List<Object?> get props => [status, statusCode, data, message];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class NewUserData extends Equatable {
  final String? name, email, phone, type, avatar;
  final num? point;

  const NewUserData(
    this.name,
    this.email,
    this.phone,
    this.point,
    this.type,
    this.avatar,
  );

  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        point,
        type,
        avatar,
      ];

  factory NewUserData.fromJson(Map<String, dynamic> json) =>
      _$NewUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserDataToJson(this);
}
