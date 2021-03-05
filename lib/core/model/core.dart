import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'core.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Core {
  final String core;
  final int flight;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final bool landing_attempt;
  final bool landing_success;
  final String landing_type;
  final String landpad;
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landing_attempt,
    this.landing_success,
    this.landing_type,
    this.landpad,
  });

  Map<String, dynamic> toJson() => _$CoreToJson(this);

  factory Core.fromJson(Map<String, dynamic> json) => _$CoreFromJson(json);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Core &&
      o.core == core &&
      o.flight == flight &&
      o.gridfins == gridfins &&
      o.legs == legs &&
      o.reused == reused &&
      o.landing_attempt == landing_attempt &&
      o.landing_success == landing_success &&
      o.landing_type == landing_type &&
      o.landpad == landpad;
  }

  @override
  int get hashCode {
    return core.hashCode ^
      flight.hashCode ^
      gridfins.hashCode ^
      legs.hashCode ^
      reused.hashCode ^
      landing_attempt.hashCode ^
      landing_success.hashCode ^
      landing_type.hashCode ^
      landpad.hashCode;
  }
}