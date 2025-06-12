// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntry _$WeatherEntryFromJson(Map<String, dynamic> json) => WeatherEntry(
  lokasi: Location.fromJson(json['lokasi'] as Map<String, dynamic>),
  cuaca:
      (json['cuaca'] as List<dynamic>)
          .map(
            (e) =>
                (e as List<dynamic>)
                    .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
                    .toList(),
          )
          .toList(),
);

Map<String, dynamic> _$WeatherEntryToJson(WeatherEntry instance) =>
    <String, dynamic>{'lokasi': instance.lokasi, 'cuaca': instance.cuaca};
