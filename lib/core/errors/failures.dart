import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with APiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with APiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with APiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with APiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response);
      case DioExceptionType.cancel:
        return ServerFailure('Request to APiServer was cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error with APiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, Please try again!');
        }
      default:
        return ServerFailure('Ops There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Please There was an Error, Please try again');
    }
  }
}
