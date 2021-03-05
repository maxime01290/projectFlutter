// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return $checkedNew('Launch', json, () {
    final val = Launch(
      $checkedConvert(json, 'auto_update', (v) => v as bool),
      $checkedConvert(json, 'launch_library_id', (v) => v as String),
      fairings: $checkedConvert(
          json,
          'fairings',
          (v) =>
              v == null ? null : Fairings.fromJson(v as Map<String, dynamic>)),
      links: $checkedConvert(json, 'links',
          (v) => v == null ? null : Links.fromJson(v as Map<String, dynamic>)),
      rocket: $checkedConvert(json, 'rocket', (v) => v as String),
      success: $checkedConvert(json, 'success', (v) => v as bool),
      details: $checkedConvert(json, 'details', (v) => v as String),
      crew: $checkedConvert(json, 'crew', (v) => v as List),
      ships: $checkedConvert(
          json, 'ships', (v) => (v as List)?.map((e) => e as String)?.toList()),
      capsules: $checkedConvert(json, 'capsules', (v) => v as List),
      launchpad: $checkedConvert(json, 'launchpad', (v) => v as String),
      failures: $checkedConvert(json, 'failures', (v) => v as List),
      flight_number: $checkedConvert(json, 'flight_number', (v) => v as int),
      name: $checkedConvert(json, 'name', (v) => v as String),
      date_utc: $checkedConvert(json, 'date_utc', (v) => v as String),
      date_unix: $checkedConvert(json, 'date_unix', (v) => v as int),
      date_local: $checkedConvert(json, 'date_local', (v) => v as String),
      date_precision:
          $checkedConvert(json, 'date_precision', (v) => v as String),
      upcoming: $checkedConvert(json, 'upcoming', (v) => v as bool),
      cores: $checkedConvert(
          json,
          'cores',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : Core.fromJson(e as Map<String, dynamic>))
              ?.toList()),
      id: $checkedConvert(json, 'id', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'autoUpdate': 'auto_update',
    'launchLibraryId': 'launch_library_id'
  });
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'fairings': instance.fairings?.toJson(),
      'links': instance.links?.toJson(),
      'rocket': instance.rocket,
      'success': instance.success,
      'details': instance.details,
      'crew': instance.crew,
      'ships': instance.ships,
      'capsules': instance.capsules,
      'launchpad': instance.launchpad,
      'auto_update': instance.autoUpdate,
      'launch_library_id': instance.launchLibraryId,
      'failures': instance.failures,
      'flight_number': instance.flight_number,
      'name': instance.name,
      'date_utc': instance.date_utc,
      'date_unix': instance.date_unix,
      'date_local': instance.date_local,
      'date_precision': instance.date_precision,
      'upcoming': instance.upcoming,
      'cores': instance.cores?.map((e) => e?.toJson())?.toList(),
      'id': instance.id,
    };
