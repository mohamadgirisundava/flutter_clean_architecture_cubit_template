import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  genericArgumentFactories: true,
)
class ListModel<T> extends Equatable {
  final int? code;
  final String? message;
  final bool? success;
  final List<T>? data;

  const ListModel(
    this.code,
    this.message,
    this.data,
    this.success,
  );

  @override
  List<Object?> get props => [code, message, data];

  factory ListModel.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$ListModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ListModelToJson(this, toJsonT);
}
