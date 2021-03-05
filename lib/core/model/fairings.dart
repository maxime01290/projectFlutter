import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fairings.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Fairings {
  final bool reused;
  final bool recovery_attempt;
  final bool recovered;
  final List<dynamic> ships;
  Fairings({
    this.reused,
    this.recovery_attempt,
    this.recovered,
    this.ships,
  });

  Map<String, dynamic> toJson() => _$FairingsToJson(this);

  factory Fairings.fromJson(Map<String, dynamic> json) => _$FairingsFromJson(json);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Fairings &&
        o.reused == reused &&
        o.recovery_attempt == recovery_attempt &&
        o.recovered == recovered &&
        listEquals(o.ships, ships);
  }

  @override
  int get hashCode {
    return reused.hashCode ^
        recovery_attempt.hashCode ^
        recovered.hashCode ^
        ships.hashCode;
  }
}
