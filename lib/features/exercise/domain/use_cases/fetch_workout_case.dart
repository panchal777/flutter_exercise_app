import 'package:dartz/dartz.dart';
import 'package:flutter_exercise_app/core/base/success_error_handling/failures.dart';
import 'package:flutter_exercise_app/features/exercise/data/models/workout_model.dart';

import '../../../../core/base/use_case.dart';
import '../repositories/workout_repository.dart';

class FetchWorkOutCase extends UseCase<List<WorkoutModel>, NoParams> {
  final WorkoutRepository workoutRepository;

  FetchWorkOutCase(this.workoutRepository);

  @override
  Future<Either<Failure, List<WorkoutModel>>> callCase(NoParams params) {
    return workoutRepository.fetchWorkouts();
  }
}
