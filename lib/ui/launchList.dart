import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/manager/api.dart';
import 'package:flutter_app_project/core/model/launch.dart';

import 'Details.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage() : super();
  @override
  State<StatefulWidget> createState() => _LaunchList();
}

class _LaunchList extends State<StatefulWidget> {
  final ScrollController scrollController = ScrollController();
  List<Launch> launchList = List();

  void searchLaunch(String term) async {
    setState(() {
      filteredLaunch.clear();
      filteredLaunch.addAll(Api().getLaunchByName(term));
      numberItem = filteredLaunch.length;
    });
  }

  @override
  void initState() {
    searchController.addListener(() {
      searchLaunch(searchController.text);
    });
    super.initState();
  }
  //searchBar
  final TextEditingController searchController = TextEditingController();
  List<Launch> filteredLaunch = List();
  List<Launch> paginatedLaunchList = List();
  bool isLoadingMore = false;
  int offset = 0;

  int numberItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Launch's list"),
    ),
     body: FutureBuilder(
        future: Api().loadContent(context),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            if (searchController.text != null && searchController.text.isNotEmpty) {
                launchList = filteredLaunch;
            }else{
              if (paginatedLaunchList.length == 0) {
                paginatedLaunchList.clear();
                paginatedLaunchList.addAll(snapchot.data);
              }
              launchList = paginatedLaunchList;
            }
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                  hintText: "Search...",
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                  )),
                              textInputAction: TextInputAction.done,
                              onSubmitted: (term) {
                                searchLaunch(term);
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              searchLaunch(searchController.text);
                            },
                          )
                        ],
                      ),
              ),
              ListView.builder(
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
            ]),
          );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        })
    );
  }
}