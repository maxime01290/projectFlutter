import 'package:json_annotation/json_annotation.dart';

part 'map_api.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class MapApi {
  final String name;
  final String full_name;
  final String locality;
  final String region;
  final String timezone;
  final double latitude;
  final double longitude;
  final int launch_attempts;
  final int launch_successes;
  final String details;
  final String status;
  final String id;

  MapApi(this.name, this.full_name, this.locality, this.region, this.timezone, this.latitude, this.longitude, this.launch_attempts, this.launch_successes, this.details, this.status, this.id);

  Map<String, dynamic> toJson() => _$MapApiToJson(this);

  factory MapApi.fromJson(Map<String, dynamic> json) => _$MapApiFromJson(json);
}