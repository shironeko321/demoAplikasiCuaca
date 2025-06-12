import 'package:json_annotation/json_annotation.dart';
import 'location.dart';
import 'weather_data.dart';

part 'weather_entry.g.dart';

@JsonSerializable()
class WeatherEntry {
  final Location lokasi;
  final List<List<WeatherData>> cuaca;

  WeatherEntry({
    required this.lokasi,
    required this.cuaca,
  });

  factory WeatherEntry.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntryFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntryToJson(this);
}
