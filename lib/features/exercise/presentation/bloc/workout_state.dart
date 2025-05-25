import 'package:flutter_exercise_app/features/exercise/data/models/workout_model.dart';

abstract class WorkoutState {
  const WorkoutState();
}

class InitialState extends WorkoutState {}

class StateLoading extends WorkoutState {}

class ErrorState extends WorkoutState {
  String errorMsg;

  ErrorState(this.errorMsg);
}

/*---------------------------*/
class FetchedWorkoutState extends WorkoutState {
  final List<WorkoutModel> workouts;

  FetchedWorkoutState(this.workouts);
}
