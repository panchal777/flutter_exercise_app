import 'package:dartz/dartz.dart' show Either, Right, Left;
import 'package:flutter_exercise_app/core/base/success_error_handling/exceptions.dart';

import 'failures.dart'
    show Failure, ServerFailure, GeneralFailure, FailureMessage;

Future<Either<Failure, T>> handleResponse<T>(
  Future<T> Function() operation,
) async {
  try {
    final result = await operation();
    return Right(result);
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message.toString(), e.statusCode));
  } on GeneralException catch (e) {
    return Left(GeneralFailure(e.message.toString(), e.statusCode));
  } catch (e) {
    return Left(FailureMessage(e.toString()));
  }
}
