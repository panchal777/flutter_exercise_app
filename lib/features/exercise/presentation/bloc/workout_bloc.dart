import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise_app/core/base/success_error_handling/failures.dart';
import 'package:flutter_exercise_app/core/base/use_case.dart';
import 'package:flutter_exercise_app/features/exercise/domain/use_cases/fetch_workout_case.dart';
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_event.dart';
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  FetchWorkOutCase fetchWorkOutCase;

  WorkoutBloc({required this.fetchWorkOutCase}) : super(InitialState()) {
    on<FetchWorkoutsEvent>(_fetchWorkouts);
    on<WorkoutCompleted>(_workOutCompleted);
  }

  FutureOr<void> _fetchWorkouts(
    FetchWorkoutsEvent event,
    Emitter<WorkoutState> emit,
  ) async {
    emit(StateLoading());
    var data = await fetchWorkOutCase.callCase(NoParams());
    data.fold(
      (l) {
        emit(ErrorState(checkErrors(l)));
      },
      (r) {
        emit(FetchedWorkoutState(r));
      },
    );
  }

  FutureOr<void> _workOutCompleted(
    WorkoutCompleted event,
    Emitter<WorkoutState> emit,
  ) async {
    var list = (state as FetchedWorkoutState).workouts;
    list[event.index] = event.workoutModel;
    emit(FetchedWorkoutState(list));
  }

  String checkErrors(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is GeneralFailure) {
      return failure.message;
    } else if (failure is FailureMessage) {
      return failure.message;
    } else {
      return 'Something went wrong';
    }
  }
}
