import 'package:flutter_exercise_app/core/utils/util.dart';
import 'package:flutter_exercise_app/features/exercise/data/data_source/workout_local_src.dart';
import 'package:flutter_exercise_app/features/exercise/data/data_source/workout_local_src_impl.dart';
import 'package:flutter_exercise_app/features/exercise/data/repositories/workout_repository_impl.dart';
import 'package:flutter_exercise_app/features/exercise/domain/repositories/workout_repository.dart';
import 'package:flutter_exercise_app/features/exercise/domain/use_cases/fetch_workout_case.dart';
import 'package:flutter_exercise_app/features/exercise/presentation/bloc/workout_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../core/retrofit/rest_client.dart';

final appSl = GetIt.instance;

Future<void> init() async {
  await _registerRetrofitClient();
  await _registerBaseClasses();
}

Future<void> _registerRetrofitClient() async {
  // Register Dio
  appSl.registerSingletonAsync<Dio>(() async => await Utils.addDio());
  await appSl.isReady<Dio>();
  // Register RestClient
  appSl.registerLazySingleton<RestClient>(() => RestClient(appSl<Dio>()));
}

Future<void> _registerBaseClasses() async {
  /*
  * Members
  * */
  appSl.registerFactory(() => WorkoutBloc(fetchWorkOutCase: appSl()));

  // Use Cases
  appSl.registerLazySingleton(() => FetchWorkOutCase(appSl()));

  // Repository
  appSl.registerLazySingleton<WorkoutRepository>(
    () => WorkoutRepositoryImpl(appSl()),
  );

  // Data sources
  appSl.registerLazySingleton<WorkoutLocalSrc>(
    () => WorkoutLocalSrcImpl(restClient: appSl()),
  );
}
