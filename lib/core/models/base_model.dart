import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, genericArgumentFactories: true)
class BaseModel<T> extends Equatable {
  final int? code;
  final String? message;
  final bool? success;
  final T? data;

  const BaseModel(this.code, this.message, this.data, this.success);

  @override
  List<Object?> get props => [code, message, data];

  factory BaseModel.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$BaseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$BaseModelToJson(this, toJsonT);
}
