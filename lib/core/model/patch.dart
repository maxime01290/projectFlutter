import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'patch.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Patch {
  final String small;
  final String large;
  Patch({
    this.small,
    this.large,
  });

  Patch copyWith({
    String small,
    String large,
  }) {
    return Patch(
      small: small ?? this.small,
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'small': small,
      'large': large,
    };
  }

  factory Patch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Patch(
      small: map['small'],
      large: map['large'],
    );
  }

  Map<String, dynamic> toJson() => _$PatchToJson(this);

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Patch &&
      o.small == small &&
      o.large == large;
  }

  @override
  int get hashCode => small.hashCode ^ large.hashCode;
}