import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LogoutModel extends Equatable {
  final String? status, message;
  final dynamic statusCode, logout;

  const LogoutModel(this.status, this.message, this.statusCode, this.logout);

  @override
  List<Object?> get props => [status, message, statusCode, logout];

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);
}
