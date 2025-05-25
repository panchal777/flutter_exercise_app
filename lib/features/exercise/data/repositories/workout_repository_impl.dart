import 'package:dartz/dartz.dart';
import 'package:flutter_exercise_app/features/exercise/data/data_source/workout_local_src.dart';
import 'package:flutter_exercise_app/features/exercise/domain/repositories/workout_repository.dart';
import '../../../../core/base/success_error_handling/failures.dart';
import '../../../../core/base/success_error_handling/handle_response.dart';
import '../models/workout_model.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  WorkoutRepositoryImpl(this._workoutLocalSrc);

  final WorkoutLocalSrc _workoutLocalSrc;

  @override
  Future<Either<Failure, List<WorkoutModel>>> fetchWorkouts() async {
    return handleResponse(() => _workoutLocalSrc.fetchWorkouts());
  }
}
