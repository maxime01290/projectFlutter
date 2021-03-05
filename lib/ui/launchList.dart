import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/manager/api.dart';
import 'package:flutter_app_project/core/model/launch.dart';

import 'Details.dart';

class _LaunchList extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api().loadContent(context),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            List<Launch> launchList = snapchot.data;

            return SingleChildScrollView(
              controller: scrollController,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: launchList.length,
                itemBuilder: (context, position) {
                  Launch launch = launchList[position];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Details.route,
                          arguments: LaunchDetailsArguments(launch: launch));
                    },
                    child: Row(
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              launch.links.patch.small ??
                                  launchList[0].links.patch.small,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                launch.name,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Launch date: ${launch.date_utc.substring(
                                  0, 10)}")
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),

            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}