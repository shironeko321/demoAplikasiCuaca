import 'package:json_annotation/json_annotation.dart';

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final DateTime datetime;
  final int t;
  final int tcc;
  final double tp;
  final int weather;

  @JsonKey(name: 'weather_desc')
  final String weatherDesc;

  @JsonKey(name: 'weather_desc_en')
  final String weatherDescEn;

  @JsonKey(name: 'wd_deg')
  final int wdDeg;

  final String wd;

  @JsonKey(name: 'wd_to')
  final String wdTo;

  final double ws;
  final int hu;
  final int vs;

  @JsonKey(name: 'vs_text')
  final String vsText;

  @JsonKey(name: 'time_index')
  final String timeIndex;

  @JsonKey(name: 'analysis_date')
  final DateTime analysisDate;

  final String image;

  @JsonKey(name: 'utc_datetime')
  final DateTime utcDatetime;

  @JsonKey(name: 'local_datetime')
  final DateTime localDatetime;

  WeatherData({
    required this.datetime,
    required this.t,
    required this.tcc,
    required this.tp,
    required this.weather,
    required this.weatherDesc,
    required this.weatherDescEn,
    required this.wdDeg,
    required this.wd,
    required this.wdTo,
    required this.ws,
    required this.hu,
    required this.vs,
    required this.vsText,
    required this.timeIndex,
    required this.analysisDate,
    required this.image,
    required this.utcDatetime,
    required this.localDatetime,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
