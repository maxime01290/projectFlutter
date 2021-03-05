import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/model/launch.dart';

class LaunchDetailsArguments {
  Launch launch;

  LaunchDetailsArguments({this.launch});
}

class Details extends StatefulWidget {
  static const route = "/details";

  Details(this.launch, this.urlImage);

  @override
  State<StatefulWidget> createState() =>_SpotDetailState();

  final Launch launch;
  final String urlImage;
}

class _SpotDetailState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.launch.name)
      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Stack(
                  children: [
                    widget.launch.links.patch.small != null?
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height:400,
                        child: Image.network(
                          widget.launch.links.patch.small,
                          fit: BoxFit.cover,
                        ),
                      ):Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    )
                  ],
                ),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                          "Launch date :  ${widget.launch.date_utc.substring(0,10)}",
                          textAlign: TextAlign.center,
                          style: (new TextStyle(
                              fontSize: 36
                          )),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Flight number :  ${widget.launch.flight_number}",
                          style: (new TextStyle(
                              fontSize: 24
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
      ),
    );
  }
}
