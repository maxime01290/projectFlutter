// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fairings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fairings _$FairingsFromJson(Map<String, dynamic> json) {
  return $checkedNew('Fairings', json, () {
    final val = Fairings(
      reused: $checkedConvert(json, 'reused', (v) => v as bool),
      recovery_attempt:
          $checkedConvert(json, 'recovery_attempt', (v) => v as bool),
      recovered: $checkedConvert(json, 'recovered', (v) => v as bool),
      ships: $checkedConvert(json, 'ships', (v) => v as List),
    );
    return val;
  });
}

Map<String, dynamic> _$FairingsToJson(Fairings instance) => <String, dynamic>{
      'reused': instance.reused,
      'recovery_attempt': instance.recovery_attempt,
      'recovered': instance.recovered,
      'ships': instance.ships,
    };
