// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapApi _$MapApiFromJson(Map<String, dynamic> json) {
  return $checkedNew('MapApi', json, () {
    final val = MapApi(
      $checkedConvert(json, 'name', (v) => v as String),
      $checkedConvert(json, 'full_name', (v) => v as String),
      $checkedConvert(json, 'locality', (v) => v as String),
      $checkedConvert(json, 'region', (v) => v as String),
      $checkedConvert(json, 'timezone', (v) => v as String),
      $checkedConvert(json, 'latitude', (v) => (v as num)?.toDouble()),
      $checkedConvert(json, 'longitude', (v) => (v as num)?.toDouble()),
      $checkedConvert(json, 'launch_attempts', (v) => v as int),
      $checkedConvert(json, 'launch_successes', (v) => v as int),
      $checkedConvert(json, 'details', (v) => v as String),
      $checkedConvert(json, 'status', (v) => v as String),
      $checkedConvert(json, 'id', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$MapApiToJson(MapApi instance) => <String, dynamic>{
      'name': instance.name,
      'full_name': instance.full_name,
      'locality': instance.locality,
      'region': instance.region,
      'timezone': instance.timezone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'launch_attempts': instance.launch_attempts,
      'launch_successes': instance.launch_successes,
      'details': instance.details,
      'status': instance.status,
      'id': instance.id,
    };
