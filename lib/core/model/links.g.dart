// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) {
  return $checkedNew('Links', json, () {
    final val = Links(
      patch: $checkedConvert(json, 'patch',
          (v) => v == null ? null : Patch.fromJson(v as Map<String, dynamic>)),
      webcast: $checkedConvert(json, 'webcast', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'patch': instance.patch?.toJson(),
      'webcast': instance.webcast,
    };
