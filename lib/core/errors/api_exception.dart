import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'errors.dart';

enum NetworkExceptions {
  requestCancelled,
  unauthorisedRequest,
  badRequest,
  badCertificate,
  notFound,
  methodNotAllowed,
  notAcceptable,
  requestTimeout,
  sendTimeout,
  conflict,
  internalServerError,
  notImplemented,
  serviceUnavailable,
  noInternetConnection,
  formatException,
  unableToProcess,
  otherError,
  unexpectedError,
  forbiddenError,
}

NetworkExceptions networkCatchError(e) {
  if (e is Exception) {
    try {
      late NetworkExceptions networkExceptions;
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.badCertificate:
            networkExceptions = NetworkExceptions.badCertificate;
            break;
          case DioExceptionType.cancel:
            networkExceptions = NetworkExceptions.requestCancelled;
            break;
          case DioExceptionType.connectionTimeout:
            networkExceptions = NetworkExceptions.requestTimeout;
            break;
          case DioExceptionType.unknown:
            if (e.error is SocketException) {
              networkExceptions = NetworkExceptions.noInternetConnection;
            } else {
              networkExceptions = NetworkExceptions.otherError;
            }
            break;
          case DioExceptionType.receiveTimeout:
            networkExceptions = NetworkExceptions.sendTimeout;
            break;
          case DioExceptionType.badResponse:
            switch (e.response?.statusCode) {
              case 400:
                networkExceptions = NetworkExceptions.badRequest;
                break;
              case 401:
                networkExceptions = NetworkExceptions.unauthorisedRequest;
                break;
              case 403:
                networkExceptions = NetworkExceptions.forbiddenError;
                break;
              case 404:
                networkExceptions = NetworkExceptions.notFound;
                break;
              case 409:
                networkExceptions = NetworkExceptions.conflict;
                break;
              case 408:
                networkExceptions = NetworkExceptions.requestTimeout;
                break;
              case 500:
                networkExceptions = NetworkExceptions.internalServerError;
                break;
              case 503:
                networkExceptions = NetworkExceptions.serviceUnavailable;
                break;
              default:
                networkExceptions = NetworkExceptions.otherError;
                break;
            }
            break;
          case DioExceptionType.sendTimeout:
            networkExceptions = NetworkExceptions.sendTimeout;
            break;
          case DioExceptionType.connectionError:
            networkExceptions = NetworkExceptions.noInternetConnection;
            break;
        }
      } else if (e is SocketException) {
        networkExceptions = NetworkExceptions.noInternetConnection;
      } else {
        networkExceptions = NetworkExceptions.unexpectedError;
      }
      return networkExceptions;
    } on FormatException catch (_) {
      return NetworkExceptions.formatException;
    } catch (_) {
      return NetworkExceptions.unexpectedError;
    }
  } else {
    if (e.toString().contains("is not a subtype of")) {
      return NetworkExceptions.unableToProcess;
    } else {
      return NetworkExceptions.unexpectedError;
    }
  }
}

ErrorObject networkCatchErrorMessage(e) {
  var title = "Terjadi Kesalahan";
  var message = "";
  switch (networkCatchError(e)) {
    case NetworkExceptions.requestCancelled:
      message = 'Request Cancelled';
      break;
    case NetworkExceptions.unauthorisedRequest:
      message = 'Unauthorised request';
      break;
    case NetworkExceptions.badRequest:
      message = 'Bad Request';
      break;
    case NetworkExceptions.notFound:
      message = 'Not Found';
      break;
    case NetworkExceptions.methodNotAllowed:
      message = 'Method Not Allowed';
      break;
    case NetworkExceptions.notAcceptable:
      message = 'Not acceptable';
      break;
    case NetworkExceptions.requestTimeout:
      message = 'Connection request timeout';
      break;
    case NetworkExceptions.sendTimeout:
      message = 'Send timeout in connection with API server';
      break;
    case NetworkExceptions.conflict:
      message = 'Error due to a conflict';
      break;
    case NetworkExceptions.internalServerError:
      message = 'Internal Server Error';
      break;
    case NetworkExceptions.notImplemented:
      message = 'Not Implemented';
      break;
    case NetworkExceptions.serviceUnavailable:
      message = 'Service unavailable';
      break;
    case NetworkExceptions.noInternetConnection:
      message = 'No internet connection';
      break;
    case NetworkExceptions.formatException:
      message = 'Failed to parse API';
      break;
    case NetworkExceptions.unableToProcess:
      message = 'Unable to process the data';
      break;
    case NetworkExceptions.otherError:
      message = 'Unexpected error occurred';
      break;
    case NetworkExceptions.unexpectedError:
      if (e is ApiException) {
        message = e.message ?? 'Unexpected error occurred';
      } else {
        message = 'Unexpected error occurred';
      }
      break;
    case NetworkExceptions.forbiddenError:
      message = 'Access Forbidden';
      break;
    case NetworkExceptions.badCertificate:
      message = 'Bad Certificate';
      break;
  }

  return ErrorObject(title, message, networkCatchError(e));
}

class ApiException extends Equatable implements Exception {
  final int? code;
  final String? message;

  const ApiException(this.code, this.message);

  @override
  List<Object?> get props => [code, message];
}
