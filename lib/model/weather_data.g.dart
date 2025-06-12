// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
  datetime: DateTime.parse(json['datetime'] as String),
  t: (json['t'] as num).toInt(),
  tcc: (json['tcc'] as num).toInt(),
  tp: (json['tp'] as num).toDouble(),
  weather: (json['weather'] as num).toInt(),
  weatherDesc: json['weather_desc'] as String,
  weatherDescEn: json['weather_desc_en'] as String,
  wdDeg: (json['wd_deg'] as num).toInt(),
  wd: json['wd'] as String,
  wdTo: json['wd_to'] as String,
  ws: (json['ws'] as num).toDouble(),
  hu: (json['hu'] as num).toInt(),
  vs: (json['vs'] as num).toInt(),
  vsText: json['vs_text'] as String,
  timeIndex: json['time_index'] as String,
  analysisDate: DateTime.parse(json['analysis_date'] as String),
  image: json['image'] as String,
  utcDatetime: DateTime.parse(json['utc_datetime'] as String),
  localDatetime: DateTime.parse(json['local_datetime'] as String),
);

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'datetime': instance.datetime.toIso8601String(),
      't': instance.t,
      'tcc': instance.tcc,
      'tp': instance.tp,
      'weather': instance.weather,
      'weather_desc': instance.weatherDesc,
      'weather_desc_en': instance.weatherDescEn,
      'wd_deg': instance.wdDeg,
      'wd': instance.wd,
      'wd_to': instance.wdTo,
      'ws': instance.ws,
      'hu': instance.hu,
      'vs': instance.vs,
      'vs_text': instance.vsText,
      'time_index': instance.timeIndex,
      'analysis_date': instance.analysisDate.toIso8601String(),
      'image': instance.image,
      'utc_datetime': instance.utcDatetime.toIso8601String(),
      'local_datetime': instance.localDatetime.toIso8601String(),
    };
