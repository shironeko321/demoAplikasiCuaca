// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      lokasi: Location.fromJson(json['lokasi'] as Map<String, dynamic>),
      data:
          (json['data'] as List<dynamic>)
              .map((e) => WeatherEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{'lokasi': instance.lokasi, 'data': instance.data};
