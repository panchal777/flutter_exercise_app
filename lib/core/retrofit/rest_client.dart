import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../features/exercise/data/models/workout_model.dart';
import '../utils/env.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Env.apiBaseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*dashboard*/
  @GET("/workouts")
  Future<List<WorkoutModel>> fetchWorkouts();
}
