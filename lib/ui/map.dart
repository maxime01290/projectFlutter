import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/manager/api.dart';
import 'package:flutter_app_project/core/model/map_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage() : super();
  @override
  State<StatefulWidget> createState() => _Map();
}

class _Map extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  static final CameraPosition _kLake = CameraPosition(
      bearing: 0,
      target: LatLng(37.090240, -95.712891),
      tilt: 59.440717697143555,
      zoom: 1
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
     body: FutureBuilder(
      future: Api().loadContentMap(context),
      builder: (context,snapchot){
        if (snapchot.hasData) {
          List<MapApi> mapList = snapchot.data;
          print("taille de la liste : ${mapList.length}");
          return GoogleMap(
            markers: markers,
            mapType: MapType.satellite,
            initialCameraPosition: _kLake,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              setState(() {
                for(var item in mapList){
                  markers.add(
                    Marker(
                      markerId: MarkerId(item.id),
                      position: LatLng(item.latitude,item.longitude)
                    ),
                  );
                }
              });
            },
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      })
    );
  }
}