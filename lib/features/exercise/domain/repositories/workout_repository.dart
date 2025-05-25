import 'package:dartz/dartz.dart';
import 'package:flutter_exercise_app/features/exercise/data/models/workout_model.dart';

import '../../../../core/base/success_error_handling/failures.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<WorkoutModel>>> fetchWorkouts();
}
