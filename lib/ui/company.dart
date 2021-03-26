import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project/core/manager/api.dart';
import 'package:flutter_app_project/core/model/companyInfo.dart';
import 'package:flutter_app_project/core/model/launch.dart';

import 'Details.dart';

class CompanyInfoPage extends StatefulWidget {
  CompanyInfoPage() : super();
  @override
  State<StatefulWidget> createState() => _CompanyInfo();
}

class _CompanyInfo extends State<StatefulWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Info"),
      ),
      body: FutureBuilder(
        future: Api().loadContentCompany(context),
        builder: (context, snapchot) {
          if (snapchot.hasData) {
            CompanyInfo companyInfo = snapchot.data;
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        companyInfo.name,
                        textAlign: TextAlign.center,
                        style: (new TextStyle(
                            fontSize: 48
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Founded in ${companyInfo.founded} by ${companyInfo.founder}",
                        style: (new TextStyle(
                            fontSize: 24
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "They have ${companyInfo.employees} employees",
                        style: (new TextStyle(
                            fontSize: 18
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        companyInfo.summary,
                        style: (new TextStyle(
                            fontSize: 16,
                        )),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Our website : ${companyInfo.infoLinks.website}",
                        style: (new TextStyle(
                          fontSize: 14,
                        )),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Our twitter : ${companyInfo.infoLinks.twitter}",
                        style: (new TextStyle(
                          fontSize: 14,
                        )),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Our flickr : ${companyInfo.infoLinks.flickr}",
                        style: (new TextStyle(
                          fontSize: 14,
                        )),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                )
              ],
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