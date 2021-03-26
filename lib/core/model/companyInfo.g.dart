// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companyInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) {
  return $checkedNew('CompanyInfo', json, () {
    final val = CompanyInfo(
      $checkedConvert(
          json,
          'headquarters',
          (v) => v == null
              ? null
              : Headquarters.fromJson(v as Map<String, dynamic>)),
      $checkedConvert(
          json,
          'links',
          (v) =>
              v == null ? null : InfoLinks.fromJson(v as Map<String, dynamic>)),
      $checkedConvert(json, 'name', (v) => v as String),
      $checkedConvert(json, 'founder', (v) => v as String),
      $checkedConvert(json, 'founded', (v) => v as int),
      $checkedConvert(json, 'employees', (v) => v as int),
      $checkedConvert(json, 'vehicles', (v) => v as int),
      $checkedConvert(json, 'launch_sites', (v) => v as int),
      $checkedConvert(json, 'test_sites', (v) => v as int),
      $checkedConvert(json, 'ceo', (v) => v as String),
      $checkedConvert(json, 'cto', (v) => v as String),
      $checkedConvert(json, 'coo', (v) => v as String),
      $checkedConvert(json, 'cto_propulsion', (v) => v as String),
      $checkedConvert(json, 'valuation', (v) => v as int),
      $checkedConvert(json, 'summary', (v) => v as String),
      $checkedConvert(json, 'id', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'infoLinks': 'links'});
}

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'headquarters': instance.headquarters?.toJson(),
      'links': instance.infoLinks?.toJson(),
      'name': instance.name,
      'founder': instance.founder,
      'founded': instance.founded,
      'employees': instance.employees,
      'vehicles': instance.vehicles,
      'launch_sites': instance.launch_sites,
      'test_sites': instance.test_sites,
      'ceo': instance.ceo,
      'cto': instance.cto,
      'coo': instance.coo,
      'cto_propulsion': instance.cto_propulsion,
      'valuation': instance.valuation,
      'summary': instance.summary,
      'id': instance.id,
    };
