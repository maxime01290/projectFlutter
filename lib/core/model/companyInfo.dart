
import 'package:flutter_app_project/core/model/headquarters.dart';
import 'package:flutter_app_project/core/model/infolinks.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companyInfo.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class CompanyInfo {
  final Headquarters headquarters;
  @JsonKey(name: "links")
  final InfoLinks infoLinks;
  final String name;
  final String founder;
  final int founded;
  final int employees;
  final int vehicles;
  final int launch_sites;
  final int test_sites;
  final String ceo;
  final String cto;
  final String coo;
  final String cto_propulsion;
  final int valuation;
  final String summary;
  final String id;

  CompanyInfo(this.headquarters, this.infoLinks, this.name, this.founder, this.founded, this.employees, this.vehicles, this.launch_sites, this.test_sites, this.ceo, this.cto, this.coo, this.cto_propulsion, this.valuation, this.summary, this.id);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => _$CompanyInfoFromJson(json);
}