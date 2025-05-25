import 'package:dartz/dartz.dart' show Either, Right, Left;
import 'package:dio/dio.dart';
import 'failures.dart' show Failure, ServerFailure, FailureMessage;

Future<Either<Failure, T>> handleResponse<T>(
  Future<T> Function() operation,
) async {
  try {
    final result = await operation();
    return Right(result);
  } on DioException catch (e) {
    return Left(handleDioError(e));
  } catch (e) {
    return Left(FailureMessage('Unexpected error: ${e.toString()}'));
  }
}

Failure handleDioError(DioException e) {
  final statusCode = e.response?.statusCode ?? 0;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return ServerFailure('Connection timeout', statusCode);
    case DioExceptionType.badResponse:
      final message =
          e.response?.data['message']?.toString() ?? 'Bad response from server';
      return ServerFailure(message, statusCode);
    case DioExceptionType.cancel:
      return ServerFailure('Request was cancelled', statusCode);
    case DioExceptionType.connectionError:
      return ServerFailure('No Internet connection', statusCode);
    default:
      return ServerFailure(e.message ?? 'Unexpected Dio error', statusCode);
  }
}
