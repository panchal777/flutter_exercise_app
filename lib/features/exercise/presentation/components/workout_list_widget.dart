import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise_app/core/routes/route_name.dart';
import 'package:flutter_exercise_app/core/utils/app_strings.dart';
import 'package:flutter_exercise_app/features/exercise/data/models/workout_model.dart';
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_bloc.dart';
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_event.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/text_widgets.dart';

class WorkoutListWidget extends StatelessWidget {
  final List<WorkoutModel> items;

  const WorkoutListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ListTile(
            tileColor: Colors.grey.shade100,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(8),
            //   side: BorderSide(color: Colors.grey.shade300),
            // ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://media.istockphoto.com/id/1203043225/photo/woman-working-out-at-home.jpg?s=612x612&w=0&k=20&c=WBJnvosPoiE8cqOL8r8Pm3DNMb8StFN46WLyypj7k9M=',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: TitleText(title: item.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(body: 'Duration: ${item.duration} seconds'),
                if (item.isCompleted)
                  Row(
                    children: [
                      BodyText(body: 'Status: '),
                      BodyText(
                        body: AppStrings.completed,
                        textStyle: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.check_circle, color: Colors.green, size: 16),
                    ],
                  ),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              navigateToDetailScreen(context, item, index);
            },
          ),
        );
      },
    );
  }

  navigateToDetailScreen(
    BuildContext context,
    WorkoutModel workoutModel,
    int index,
  ) {
    final bloc = context.read<WorkoutBloc>();
    context.pushNamed(RouteName.workoutDetails, extra: workoutModel).then((
      value,
    ) {
      if (value != null && value is WorkoutModel) {
        bloc.add(WorkoutCompleted(workoutModel, index));
      }
    });
  }
}
