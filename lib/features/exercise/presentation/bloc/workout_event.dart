import '../../data/models/workout_model.dart';

abstract class WorkoutEvent {
  const WorkoutEvent();
}

class FetchWorkoutsEvent extends WorkoutEvent {}

class WorkoutCompleted extends WorkoutEvent {
  final WorkoutModel workoutModel;
  final int index;

  WorkoutCompleted(this.workoutModel, this.index);
}
