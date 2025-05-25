import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/core/utils/app_extensions.dart';
import 'package:flutter_exercise_app/core/utils/app_strings.dart';
import 'package:flutter_exercise_app/core/widgets/text_widgets.dart';
import 'dart:async';

import 'package:flutter_exercise_app/features/exercise/data/models/workout_model.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final WorkoutModel workoutModel;

  const WorkoutDetailScreen({super.key, required this.workoutModel});

  @override
  WorkoutDetailScreenState createState() => WorkoutDetailScreenState();
}

class WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  bool isStarted = false;
  int secondsLeft = 0;
  Timer? timer;
  bool isCompleted = false;

  var cardBorderColor = Colors.blueGrey.shade300;

  @override
  void initState() {
    super.initState();
    if (widget.workoutModel.isCompleted) {
      isCompleted = true;
    }
  }

  void startTimer() {
    setState(() {
      isStarted = true;
      secondsLeft = widget.workoutModel.duration;
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        timer.cancel();
        setState(() {
          isStarted = false;
          isCompleted = true;
          widget.workoutModel.isCompleted = true;
        });
        Future.delayed(Duration(seconds: 2), () {
          if (mounted) {
            Navigator.pop(context, widget.workoutModel);
          }
        });
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = widget.workoutModel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(model.name.capitalizeFirst())),
        body: Card(
          color: Colors.white,
          margin: EdgeInsets.all(10),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: cardBorderColor, width: 0.2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: cardBorderColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: TitleText(title: model.name),
              ),
              Container(height: 0.8, color: cardBorderColor),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyLargeText(body: AppStrings.description),
                    BodyText(body: model.description),
                    const SizedBox(height: 10),
                    BodyLargeText(body: AppStrings.difficulty),
                    BodyText(body: model.difficulty),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BodyLargeText(body: AppStrings.duration),
                            BodyText(body: "${model.duration} seconds"),
                          ],
                        ),
                        if (isStarted && !isCompleted)
                          Text(
                            "⏱ $secondsLeft s",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ElevatedButton.icon(
                          onPressed: () {
                            isStarted || isCompleted ? null : startTimer();
                          },
                          icon: Icon(
                            isCompleted
                                ? Icons.done
                                : isStarted
                                ? Icons.timer
                                : Icons.play_arrow,
                            color: Colors.white,
                          ),
                          label: Text(
                            isCompleted
                                ? AppStrings.completed
                                : isStarted
                                ? AppStrings.inProgress
                                : AppStrings.start,
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: isCompleted
                                ? Colors.green
                                : isStarted
                                ? Colors.grey
                                : Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
