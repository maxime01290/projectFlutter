import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'core.dart';
import 'fairings.dart';
import 'links.dart';

part 'launch.g.dart';

@JsonSerializable(
    checked: true, explicitToJson: true, fieldRename: FieldRename.snake)
class Launch {
    final Fairings fairings;
    final Links links;
    final String rocket;
    final bool success;
    final String details;
    final List<dynamic> crew;
    final List<String> ships;
    final List<dynamic> capsules;
    final String launchpad;
    final bool autoUpdate;
    final String launchLibraryId;
    final List<dynamic> failures;
    final int flight_number;
    final String name;
    final String date_utc;
    final int date_unix;
    final String date_local;
    final String date_precision;
    final bool upcoming;
    final List<Core> cores;
    final String id;

    Launch(this.autoUpdate, this.launchLibraryId, {
        this.fairings,
        this.links,
        this.rocket,
        this.success,
        this.details,
        this.crew,
        this.ships,
        this.capsules,
        this.launchpad,
        this.failures,
        this.flight_number,
        this.name,
        this.date_utc,
        this.date_unix,
        this.date_local,
        this.date_precision,
        this.upcoming,
        this.cores,
        this.id,
    });

    Map<String, dynamic> toJson() => _$LaunchToJson(this);

    factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

    @override
    bool operator ==(Object o) {
        if (identical(this, o)) return true;

        return o is Launch &&
            o.fairings == fairings &&
            o.links == links &&
            o.rocket == rocket &&
            o.success == success &&
            o.details == details &&
            listEquals(o.crew, crew) &&
            listEquals(o.ships, ships) &&
            listEquals(o.capsules, capsules) &&
            o.launchpad == launchpad &&
            o.autoUpdate == autoUpdate &&
            o.launchLibraryId == launchLibraryId &&
            listEquals(o.failures, failures) &&
            o.flight_number == flight_number &&
            o.name == name &&
            o.date_utc == date_utc &&
            o.date_unix == date_unix &&
            o.date_local == date_local &&
            o.date_precision == date_precision &&
            o.upcoming == upcoming &&
            listEquals(o.cores, cores) &&
            o.id == id;
    }

    @override
    int get hashCode {
        return fairings.hashCode ^
        links.hashCode ^
        rocket.hashCode ^
        success.hashCode ^
        details.hashCode ^
        crew.hashCode ^
        ships.hashCode ^
        capsules.hashCode ^
        launchpad.hashCode ^
        autoUpdate.hashCode ^
        launchLibraryId.hashCode ^
        failures.hashCode ^
        flight_number.hashCode ^
        name.hashCode ^
        date_utc.hashCode ^
        date_unix.hashCode ^
        date_local.hashCode ^
        date_precision.hashCode ^
        upcoming.hashCode ^
        cores.hashCode ^
        id.hashCode;
    }
}

