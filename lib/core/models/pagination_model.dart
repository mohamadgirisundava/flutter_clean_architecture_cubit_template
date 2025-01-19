import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  genericArgumentFactories: true,
)
class PaginationModel<T> extends Equatable {
  final PaginationTData<T>? data;
  final int? code;
  final String? message;
  final bool? success;

  const PaginationModel(this.data, this.code, this.message, this.success);

  @override
  List<Object?> get props => [success, data, code];

  factory PaginationModel.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$PaginationModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$PaginationModelToJson(this, toJsonT);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PaginationData extends Equatable {
  final dynamic perPage, currentPage, totalPages;

  const PaginationData(this.perPage, this.currentPage, this.totalPages);

  @override
  List<Object?> get props => [perPage, currentPage, totalPages];

  factory PaginationData.fromJson(Map<String, dynamic> json) =>
      _$PaginationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDataToJson(this);
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  genericArgumentFactories: true,
)
class PaginationTData<T> extends Equatable {
  final List<T>? list;
  final PaginationData? pagination;

  const PaginationTData(this.list, this.pagination);

  @override
  List<Object?> get props => [list];

  factory PaginationTData.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$PaginationTDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$PaginationTDataToJson(this, toJsonT);
}
