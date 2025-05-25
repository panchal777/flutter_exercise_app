import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise_app/core/utils/app_strings.dart';
import 'package:flutter_exercise_app/core/widgets/error_widget_with_retry.dart';
import 'package:flutter_exercise_app/core/widgets/text_widgets.dart';
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_state.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../data/models/workout_model.dart';
import '../../bloc/workout_bloc.dart';
import '../../bloc/workout_event.dart';
import '../../components/workout_list_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WorkoutModel> items = [];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.dashboardTitle)),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(title: AppStrings.exercise),
              SizedBox(height: 15),
              Expanded(
                child: BlocConsumer<WorkoutBloc, WorkoutState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is StateLoading) {
                      return LoadingWidget();
                    } else if (state is ErrorState) {
                      return ErrorWidgetWithRetry(
                        message: state.errorMsg,
                        onRetry: () {
                          context.read<WorkoutBloc>().add(FetchWorkoutsEvent());
                        },
                      );
                    } else {
                      if (state is FetchedWorkoutState) {
                        items = state.workouts;
                      }

                      return WorkoutListWidget(items: items);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
