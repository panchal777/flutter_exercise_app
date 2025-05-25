import '../models/workout_model.dart';

abstract class WorkoutLocalSrc {
  Future<List<WorkoutModel>> fetchWorkouts();
}
