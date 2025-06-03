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
    secondsLeft = widget.workoutModel.duration;
  }

  void startTimer() {
    setState(() {
      isStarted = true;
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

  void pauseTimer() {
    timer!.cancel();
    debugPrint('secondsLeft --> $secondsLeft');
  }

  void resumeTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsLeft == 0) {
        timer.cancel();
        setState(() {
          isStarted = false;
          isCompleted = false;
          widget.workoutModel.isCompleted = false;
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
                        Text(
                          "⏱ $secondsLeft s",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),

                        btn(),
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

  Widget btn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isStarted && timer != null)
          ElevatedButton.icon(
            onPressed: () {
              resumeTimer();
            },
            icon: Icon(Icons.play_circle, color: Colors.white),
            label: Text("Resume", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.deepPurple,
            ),
          ),

        ElevatedButton.icon(
          onPressed: () {
            if (!isStarted && !isCompleted) {
              startTimer();
            } else {
              pauseTimer();
            }
          },
          icon: Icon(
            isCompleted
                ? Icons.done
                : isStarted
                ? Icons.pause
                : Icons.play_arrow,
            color: Colors.white,
          ),
          label: Text(
            isCompleted
                ? AppStrings.completed
                : isStarted
                ? AppStrings.pause
                : AppStrings.start,
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: isCompleted
                ? Colors.green
                : isStarted
                ? Colors.deepOrange
                : Colors.green,
          ),
        ),
      ],
    );
  }
}
