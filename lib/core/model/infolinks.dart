import 'package:json_annotation/json_annotation.dart';

part 'infolinks.g.dart';

@JsonSerializable(checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class InfoLinks {

  String website;
  String flickr;
  String twitter;
  String elon_twitter;

  InfoLinks();

   factory InfoLinks.fromJson(Map<String, dynamic> json) => _$InfoLinksFromJson(json);
   Map<String, dynamic> toJson() => _$InfoLinksToJson(this);
}