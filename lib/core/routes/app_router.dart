import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise_app/core/routes/route_name.dart'
    show RouteName;
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_bloc.dart';
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_event.dart';
import 'package:go_router/go_router.dart';

import '../../features/exercise/data/models/workout_model.dart';
import '../../features/exercise/presentation/screens/dashboard/dashboard_screen.dart';
import '../../features/exercise/presentation/screens/initial/splash_screen.dart';

import 'package:flutter_exercise_app/features/exercise/injection_container.dart'
    as app_Sl;

import '../../features/exercise/presentation/screens/workout_details/workout_details_screen.dart';

class AppRouter {
  AppRouter._();

  /// Key so we can navigate without context.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /*----------------------------------------*/

  static GoRouter? _baseRoutes;

  static GoRouter get baseRouters => _baseRoutes!;

  static List<GoRoute> get routes => _routes;

  static void init() {
    _baseRoutes = GoRouter(
      initialLocation: '/',
      navigatorKey: navigatorKey,
      routes: <GoRoute>[...routes],
      redirect: (context, state) {
        return null;
      },
    );
  }

  static final _routes = <GoRoute>[
    GoRoute(
      path: RouteName.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      name: RouteName.dashboard,
      path: RouteName.dashboard,
      builder: (context, state) {
        return BlocProvider(
          create: (context) =>
              app_Sl.appSl<WorkoutBloc>()..add(FetchWorkoutsEvent()),
          child: DashboardScreen(),
        );
      },
    ),
    GoRoute(
      name: RouteName.workoutDetails,
      path: RouteName.workoutDetails,
      builder: (context, state) {
        return WorkoutDetailScreen(workoutModel: state.extra as WorkoutModel);
      },
    ),
  ];
}
