import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/core/routes/app_router.dart';
import 'package:flutter_exercise_app/features/exercise/injection_container.dart'
    as app_Sl;

Future<void> main() async {
  AppRouter.init();
  await app_Sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aletha Health',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: AppRouter.baseRouters,
    );
  }
}
