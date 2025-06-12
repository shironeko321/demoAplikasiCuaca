import 'package:json_annotation/json_annotation.dart';
import 'location.dart';
import 'weather_entry.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  final Location lokasi;
  final List<WeatherEntry> data;

  WeatherResponse({
    required this.lokasi,
    required this.data,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
