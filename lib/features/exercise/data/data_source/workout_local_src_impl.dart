import 'package:flutter_exercise_app/features/exercise/data/data_source/workout_local_src.dart';
import 'package:flutter_exercise_app/features/exercise/data/models/workout_model.dart';
import '../../../../core/retrofit/rest_client.dart';

class WorkoutLocalSrcImpl extends WorkoutLocalSrc {
  late RestClient restClient;

  WorkoutLocalSrcImpl({required this.restClient});

  // Future initRestClient() async {
  //   Dio dio = Dio();
  //   dio.options.baseUrl = Env.apiBaseUrl;
  //   dio.interceptors.add(LogInterceptor(responseBody: true));
  //   restClient = (RestClient(dio));
  // }

  @override
  Future<List<WorkoutModel>> fetchWorkouts() async {
    var list = await restClient.fetchWorkouts();
    return list;
  }
}
