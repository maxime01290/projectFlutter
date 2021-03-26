// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infolinks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoLinks _$InfoLinksFromJson(Map<String, dynamic> json) {
  return $checkedNew('InfoLinks', json, () {
    final val = InfoLinks();
    $checkedConvert(json, 'website', (v) => val.website = v as String);
    $checkedConvert(json, 'flickr', (v) => val.flickr = v as String);
    $checkedConvert(json, 'twitter', (v) => val.twitter = v as String);
    $checkedConvert(
        json, 'elon_twitter', (v) => val.elon_twitter = v as String);
    return val;
  });
}

Map<String, dynamic> _$InfoLinksToJson(InfoLinks instance) => <String, dynamic>{
      'website': instance.website,
      'flickr': instance.flickr,
      'twitter': instance.twitter,
      'elon_twitter': instance.elon_twitter,
    };
