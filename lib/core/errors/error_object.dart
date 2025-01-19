import 'package:flutter_clean_architecture_cubit_template/core/errors/api_exception.dart';
import 'package:equatable/equatable.dart';

import 'errors.dart';

class ErrorObject extends Equatable {
  final String title, message;
  final NetworkExceptions exceptionType;

  const ErrorObject(this.title, this.message, this.exceptionType);

  @override
  List<Object?> get props => [exceptionType];
}
