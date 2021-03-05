// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Core _$CoreFromJson(Map<String, dynamic> json) {
  return $checkedNew('Core', json, () {
    final val = Core(
      core: $checkedConvert(json, 'core', (v) => v as String),
      flight: $checkedConvert(json, 'flight', (v) => v as int),
      gridfins: $checkedConvert(json, 'gridfins', (v) => v as bool),
      legs: $checkedConvert(json, 'legs', (v) => v as bool),
      reused: $checkedConvert(json, 'reused', (v) => v as bool),
      landing_attempt:
          $checkedConvert(json, 'landing_attempt', (v) => v as bool),
      landing_success:
          $checkedConvert(json, 'landing_success', (v) => v as bool),
      landing_type: $checkedConvert(json, 'landing_type', (v) => v as String),
      landpad: $checkedConvert(json, 'landpad', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$CoreToJson(Core instance) => <String, dynamic>{
      'core': instance.core,
      'flight': instance.flight,
      'gridfins': instance.gridfins,
      'legs': instance.legs,
      'reused': instance.reused,
      'landing_attempt': instance.landing_attempt,
      'landing_success': instance.landing_success,
      'landing_type': instance.landing_type,
      'landpad': instance.landpad,
    };
