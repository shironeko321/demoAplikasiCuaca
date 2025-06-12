import 'package:demo/model/weather_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_client.g.dart';

@RestApi(baseUrl: 'https://api.bmkg.go.id/publik/')
abstract class WeatherClient {
  factory WeatherClient(Dio dio, {String baseUrl}) = _WeatherClient;

  @GET('/prakiraan-cuaca')
  Future<WeatherResponse> getWeatherByAdm4(@Query('adm4') String adm4);
}
