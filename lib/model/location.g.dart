// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  adm1: json['adm1'] as String,
  adm2: json['adm2'] as String,
  adm3: json['adm3'] as String,
  adm4: json['adm4'] as String,
  provinsi: json['provinsi'] as String,
  kotkab: json['kotkab'] as String,
  kecamatan: json['kecamatan'] as String,
  desa: json['desa'] as String,
  lon: (json['lon'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
  timezone: json['timezone'] as String,
  type: json['type'] as String?,
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'adm1': instance.adm1,
  'adm2': instance.adm2,
  'adm3': instance.adm3,
  'adm4': instance.adm4,
  'provinsi': instance.provinsi,
  'kotkab': instance.kotkab,
  'kecamatan': instance.kecamatan,
  'desa': instance.desa,
  'lon': instance.lon,
  'lat': instance.lat,
  'timezone': instance.timezone,
  'type': instance.type,
};
