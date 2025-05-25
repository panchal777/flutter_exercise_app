import 'package:dartz/dartz.dart';
import 'package:flutter_exercise_app/core/base/success_error_handling/failures.dart'
    show Failure;

abstract class UseCase<Type, T> {
  Future<Either<Failure, Type>> callCase(T params);
}

class NoParams {}
