import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/model/launch.dart';

class ApiManager {
  List<Launch> launchList;

  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  ApiManager._internal();

  Future<List<Launch>> loadSpots(BuildContext context) async {
    var jsonString = await DefaultAssetBundle.of(context)
        .loadString("/upcoming");
    var json = jsonDecode(jsonString);
    launchList = List<Map<String, dynamic>>.from(json["data"])
        .map((json) => Launch.fromJson(json))
        .toList();
    return launchList;
  }

  /// Renvoie un spot aléatoire de la liste pré-chargée
  Launch getRandomSpot() {
    if (launchList != null && launchList.isNotEmpty) {
      var random = Random();
      int randomIndex = random.nextInt(launchList.length - 1);
      return launchList[randomIndex];
    }
    return null;
  }

  /// Renvoie les spots de l'interval défini
  /// [startIndex] est l'index de début de l'interval
  /// [endIndex] est l'index de fin de l'interval
  List<Launch> getSomeSpots({int startIndex = 0, int endIndex = 15}) {
    if (launchList != null &&
        launchList.isNotEmpty &&
        startIndex < launchList.length &&
        startIndex < endIndex) {
      if (endIndex > launchList.length) {
        endIndex = launchList.length;
      }
      return launchList.getRange(startIndex, endIndex).toList();
    }
    return null;
  }

  /// Renvoie les spots dont le titre contient la chapine de caractère passée
  /// en paramètre
  // List<Launch> getSpotsByName(String name) {
  //   List<Spot> matchingSpots = List();
  //   if (launchList != null && launchList.isNotEmpty) {
  //     for (Launch launch in launchList) {
  //       if (launch.title.toLowerCase().contains(name.toLowerCase())) {
  //         matchingSpots.add(spot);
  //       }
  //     }
  //   }
  //   return matchingSpots;
  // }
}
